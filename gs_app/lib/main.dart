import 'package:flutter/material.dart';
import 'package:gs_app/pages/home_page.dart';
import 'package:gs_app/pages/veiculo_detalhes.dart';
import 'package:gs_app/pages/veiculos_cadastro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/veiculo-detalhes': (context) => const VeiculoDetalhes(),
        '/veiculo-cadastro': (context) => VeiculosCadastro(),
      },
      initialRoute: '/',
    );
  }
}
