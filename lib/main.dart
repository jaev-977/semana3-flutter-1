import 'package:flutter/material.dart';
import 'package:semana3noticias/pages/home.page.dart';

void main() {
  runApp(MiAplication());
}

class MiAplication extends StatelessWidget {
  const MiAplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora Smenana2",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
