import 'package:defiant/models/poap.dart';

abstract class PoapRepository {
  Future<List<Poap>> fetchPoaps(String address);
}

class NetworkPoapRepository implements PoapRepository {
  @override
  Future<List<Poap>> fetchPoaps(String address) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return [
          Poap(
            tokenId: '5599933',
            imageUrl:
                'https://assets.poap.xyz/nec-mergitur-edition-33-2022-logo-1662634861554.png',
            createdAt: '2022-09-08 19:58:45',
            chain: 'xdai',
            name: 'Nec Mergitur Edition #33',
            description:
                'For Nec Mergitur\'s 33rd edition (8th of September 2022).',
          ),
          Poap(
            tokenId: '5599934',
            imageUrl:
                'https://assets.poap.xyz/nec-mergitur-edition-33-2022-logo-1662634861554.png',
            createdAt: '2022-09-08 19:58:45',
            chain: 'xdai',
            name: 'Nec Mergitur Edition #33',
            description:
                'For Nec Mergitur\'s 33rd edition (8th of September 2022).',
          ),
          Poap(
            tokenId: '5599935',
            imageUrl:
                'https://assets.poap.xyz/nec-mergitur-edition-33-2022-logo-1662634861554.png',
            createdAt: '2022-09-08 19:58:45',
            chain: 'xdai',
            name: 'Nec Mergitur Edition #33',
            description:
                'For Nec Mergitur\'s 33rd edition (8th of September 2022).',
          ),
          Poap(
            tokenId: '5599936',
            imageUrl:
                'https://assets.poap.xyz/nec-mergitur-edition-33-2022-logo-1662634861554.png',
            createdAt: '2022-09-08 19:58:45',
            chain: 'xdai',
            name: 'Nec Mergitur Edition #33',
            description:
                'For Nec Mergitur\'s 33rd edition (8th of September 2022).',
          ),
        ];
      },
    );
  }
}

class NetworkException implements Exception {}
