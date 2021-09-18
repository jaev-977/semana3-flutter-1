import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:semana3noticias/models/articles.model.dart';

class ArticuloProvider {
  Future<List<Articulo>> getArticulo() async {
    List<Articulo> listaArticulos = [];
    Map<String, String> parametros = {
      'q': 'tesla',
      'from': '2021-09-17',
      'sortBy': 'publishedAt',
      'apikey': '7ea53af63e7f4e61808be404d4f4dd47',
    };
    var url = Uri.https('newsapi.org', '/v2/everything', parametros);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse['articles']
          .forEach((item) => {listaArticulos.add(Articulo.fromJson(item))});
      //print('Number of books about http: $itemCount.');
    }
    return listaArticulos;
  }
}
