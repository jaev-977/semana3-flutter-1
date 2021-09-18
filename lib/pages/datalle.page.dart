import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:semana3noticias/models/articulo.model.dart';
import 'package:flutter_share/flutter_share.dart';

class DatallePage extends StatelessWidget {
  final Articulo articulo;

  DatallePage({required this.articulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articulo.title),
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            GestureDetector(onTap: share, child: Icon(Icons.share))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 20, 0, 20),
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
          child: Row(
            children: [
              Text("Autor: ${articulo.author}"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Titulo: ${articulo.title}"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Descripción: ${articulo.description}"),
        ),
      ],
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: articulo.title,
        text: articulo.description,
        linkUrl: articulo.url,
        chooserTitle: articulo.title);
  }
}
