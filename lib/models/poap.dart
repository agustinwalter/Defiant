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

  Poap.fromJson(Map json)
      : tokenId = json['tokenId'],
        imageUrl = json['event']['image_url'],
        createdAt = json['created'],
        chain = json['chain'],
        name = json['event']['name'],
        description = json['event']['description'];

  Map<String, dynamic> toJson() => {
        'tokenId': tokenId,
        'created': createdAt,
        'chain': chain,
        'event': {
          'image_url': imageUrl,
          'name': name,
          'description': description,
        },
      };
}
