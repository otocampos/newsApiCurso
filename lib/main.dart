import 'package:flutter/material.dart';
import 'package:news_app_aula/Constantes/constantesRotas.dart';
import 'package:news_app_aula/Paginas/telaFeedNoticias.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Rotas.ROTA_FEED_NEWS,
      theme: ThemeData(primarySwatch: Colors.red),
      routes: {Rotas.ROTA_FEED_NEWS:(context) => telaFeedNoticias()},
    );
  }
}

