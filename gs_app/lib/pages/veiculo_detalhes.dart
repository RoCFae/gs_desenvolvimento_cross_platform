import 'package:flutter/material.dart';
import 'package:gs_app/models/veiculos.dart';
import 'package:intl/intl.dart';

class VeiculoDetalhes extends StatelessWidget {
  const VeiculoDetalhes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final veiculo = ModalRoute.of(context)!.settings.arguments as Veiculos;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(veiculo.identificacao),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('Descrição'),
              subtitle: Text(veiculo.descricao),
            ),
            ListTile(
              title: const Text('Placa'),
              subtitle: Text(veiculo.placa),
            ),
            const ListTile(
              title: Text('Bateria'),
              subtitle: Text('98%'),
            ),
            const ListTile(
              title: Text('Localização'),
              subtitle: Text('Avenida Brasil, nº 128'),
            ),
          ],
        ),
      ),
    );
  }
}
