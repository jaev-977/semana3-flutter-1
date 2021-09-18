class Articulo {
  Source source;
  String author;
  String title;
  String descriptions;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Articulo({
    required this.source,
    required this.author,
    required this.title,
    required this.descriptions,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Articulo.fromJson(Map<String, dynamic> json) => Articulo(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? '',
        title: json["title"] ?? '',
        descriptions: json["descriptions"] ?? '',
        url: json["url"] ?? '',
        urlToImage: json["urlToImage"] ?? '',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? '',
      );
}

class Source {
  String id;
  String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) =>
      Source(id: json["id"] ?? '', name: json["name"] ?? '');
}
