import 'package:flutter/material.dart';
import 'package:semana3noticias/Providers/articulo.provider.dart';
import 'package:semana3noticias/Widgets/card.widget.dart';
import 'package:semana3noticias/models/articulo.model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ArticuloProvider articuloProvider = ArticuloProvider();
  Future<List<Articulo>>? listaArticulos;
  int temporal = 1;
  @override
  void initState() {
    listaArticulos = articuloProvider.getArticulos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: _body(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              temporal++;
              listaArticulos = articuloProvider.getArticulos(page: temporal);
            });
          },
          child: Icon(Icons.new_label),
        ));
  }

  _body() {
    return FutureBuilder(
        future: listaArticulos,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<CardWidget> lista = [];

            snapshot.data.forEach((item) => {
                  lista.add(CardWidget(
                    articulo: item,
                  ))
                });
            return ListView(
              children: lista,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
