class Articulo {
  String author;
  String title;
  String descriptions;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Articulo({
    required this.author,
    required this.title,
    required this.descriptions,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Articulo.fromJson(Map<String, dynamic> json) => Articulo(
        author: json["author"] ?? '',
        title: json["title"] ?? '',
        descriptions: json["descriptions"] ?? '',
        url: json["url"] ?? '',
        urlToImage: json["urlToImage"] ?? '',
        publishedAt: json["publishedAt"] ?? '',
        content: json["content"] ?? '',
      );
}
