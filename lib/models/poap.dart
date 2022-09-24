class Poap {
  final String tokenId;
  final String imageUrl;
  final String createdAt;
  final String chain;
  final String name;
  final String description;

  Poap({
    required this.tokenId,
    required this.imageUrl,
    required this.createdAt,
    required this.chain,
    required this.name,
    required this.description,
  });

  Poap.fromJSON({required Map json})
      : tokenId = json['tokenId'],
        imageUrl = json['event']['image_url'],
        createdAt = json['created'],
        chain = json['chain'],
        name = json['event']['name'],
        description = json['event']['description'];
}
