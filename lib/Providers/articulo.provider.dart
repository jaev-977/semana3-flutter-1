import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:semana3noticias/models/articulo.model.dart';

class ArticuloProvider {
  Future<List<Articulo>> getArticulos({int page = 1}) async {
    List<Articulo> listaArticulos = [];

    Map<String, String> parametros = {
      'q': 'tesla',
      'from': '2021-08-18',
      'sortBy': 'publishedAt',
      'apikey': '7ea53af63e7f4e61808be404d4f4dd47',
      'pageSize': '20',
      'page': '${page}',
    };
    var response =
        await http.get(Uri.https('newsapi.org', '/v2/everything', parametros));
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse["articles"]
          .forEach((item) => listaArticulos.add(Articulo.fromJson(item)));
    }
    return listaArticulos;
  }
}
