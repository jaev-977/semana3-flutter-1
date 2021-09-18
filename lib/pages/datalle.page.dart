import 'package:flutter/material.dart';
import 'package:semana3noticias/models/articulo.model.dart';

class DatallePage extends StatelessWidget {
  final Articulo articulo;

  DatallePage({required this.articulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articulo.title),
      ),
    );
  }
}
