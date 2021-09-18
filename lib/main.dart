import 'package:flutter/material.dart';

import 'pages/home.page.dart';

void main() {
  runApp(MiAplication());
}

class MiAplication extends StatelessWidget {
  const MiAplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData.dark(),
    );
  }
}
