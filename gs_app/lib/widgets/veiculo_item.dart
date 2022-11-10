import 'package:flutter/material.dart';
import 'package:gs_app/models/veiculos.dart';

class VeiculoItem extends StatelessWidget {
  final Veiculos veiculo;
  const VeiculoItem({Key? key, required this.veiculo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.greenAccent,
        child: Icon(
          Icons.car_rental_outlined,
          size: 20,
          color: Colors.white,
        ),
      ),
      title: Text(veiculo.identificacao),
      subtitle: Text(veiculo.placa),
      onTap: () {
        Navigator.pushNamed(context, '/veiculo-detalhes', arguments: veiculo);
      },
    );
  }
}
