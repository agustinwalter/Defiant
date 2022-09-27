import 'dart:convert';
import 'package:defiant/db/app_database.dart';
import 'package:defiant/models/local_poaps_registry.dart';
import 'package:defiant/models/poap.dart';
import 'package:http/http.dart' as http;
import 'package:sembast/sembast.dart';

abstract class PoapRepository {
  Future<List<Poap>> getAllByAddress(String address);
}

class NetworkPoapRepository implements PoapRepository {
  @override
  Future<List<Poap>> getAllByAddress(String address) async {
    final response = await http.get(Uri(
      scheme: 'https',
      host: 'api.poap.xyz',
      path: 'actions/scan/$address',
    ));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((json) => Poap.fromJson(json))
          .toList();
    }
    return [];
  }
}

class LocalPoapRepository implements PoapRepository {
  static const String _poapStoreName = 'poaps';
  final _poapStore = intMapStoreFactory.store(_poapStoreName);
  Future<Database> get _db async => await AppDatabase.instance.database;

  @override
  Future<List<Poap>> getAllByAddress(String address) async {
    final recordSnapshots = await _poapStore.findFirst(
      await _db,
      finder: Finder(filter: Filter.equals('address', address)),
    );
    return recordSnapshots != null
        ? LocalPoapsRegistry.fromJson(recordSnapshots.value).poaps
        : [];
  }

  Future<void> save(LocalPoapsRegistry localPoapsRegistry) async {
    await _poapStore.add(await _db, localPoapsRegistry.toJson());
  }
}
