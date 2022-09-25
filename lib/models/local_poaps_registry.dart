import 'package:defiant/models/poap.dart';

class LocalPoapsRegistry {
  final String address;
  final List<Poap> poaps;

  LocalPoapsRegistry({required this.address, required this.poaps});

  LocalPoapsRegistry.fromJson(Map json)
      : address = json['address'],
        poaps = List<Poap>.from(
          (json['poaps'] as List).map(
            (poapJson) => Poap.fromJson(poapJson),
          ),
        );

  Map<String, dynamic> toJson() => {
        'address': address,
        'poaps': poaps.map((poap) => poap.toJson()).toList(),
      };
}
