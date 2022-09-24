import 'dart:convert';
import 'package:defiant/models/poap.dart';
import 'package:http/http.dart' as http;

abstract class PoapRepository {
  Future<List<Poap>> fetchPoaps(String address);
}

class NetworkPoapRepository implements PoapRepository {
  @override
  Future<List<Poap>> fetchPoaps(String address) async {
    final response = await http.get(Uri(
      scheme: 'https',
      host: 'api.poap.xyz',
      path: 'actions/scan/$address',
    ));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((json) => Poap.fromJSON(json: json))
          .toList();
    }
    return [];
  }
}

class NetworkException implements Exception {}
