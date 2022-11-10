import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExtraPage extends StatefulWidget {
  const ExtraPage({Key? key}) : super(key: key);

  State<ExtraPage> createState() => _ExtraPageState();
}

class _ExtraPageState extends State<ExtraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Participantes"),
      ),
      body: Center(
        child: Column(children: const [
          ListTile(
            title: Text('Rodrigo Contato Faé'),
            subtitle: Text('RM 84623'),
          ),
          ListTile(
            title: Text('Marcelo Cortez Monteiro'),
            subtitle: Text('RM 84564'),
          ),
          ListTile(
            title: Text('Luis Henrique Neves Dias'),
            subtitle: Text('RM 84807'),
          ),
        ]),
      ),
    );
  }
}
