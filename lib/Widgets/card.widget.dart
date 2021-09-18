import 'package:flutter/material.dart';
import 'package:semana3noticias/models/articulo.model.dart';
import 'package:intl/intl.dart';
import 'package:semana3noticias/pages/datalle.page.dart';

class CardWidget extends StatelessWidget {
  final Articulo articulo;

  CardWidget({required this.articulo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DatallePage(articulo: articulo)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(DateFormat("dd-MM-yyyy").format(articulo.publishedAt))
                ]),
              ),
              articulo.urlToImage == ''
                  ? Image(
                      image: AssetImage('assets/noimage.jpg'),
                    )
                  : FadeInImage(
                      placeholder: AssetImage('assets/loading.gif'),
                      image: NetworkImage(articulo.urlToImage)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(articulo.title),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(articulo.descriptions),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.black26, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
