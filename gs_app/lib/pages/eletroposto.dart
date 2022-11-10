import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gs_app/models/eletroposto.dart';
import 'package:gs_app/repository/eletroposto_repository.dart';

class Eletroposto extends StatefulWidget {
  const Eletroposto({Key? key}) : super(key: key);

  @override
  State<Eletroposto> createState() => _EletropostoState();
}

class _EletropostoState extends State<Eletroposto> {
  late Future<List<Eletro>> futureEletro;
  @override
  void initState() {
    super.initState();
    carregarEletroposto();
  }

  void carregarEletroposto() {
    futureEletro = fetchEletroposto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eletroposto'),
      ),
      body: FutureBuilder<List<Eletro>>(
        future: fetchEletroposto(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final eletropostos = snapshot.data ?? [];
            return ListView.separated(
              itemBuilder: (context, index) {
                final todo = eletropostos[index];
                return Container(
                  height: 100.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(children: [
                    Expanded(flex: 1, child: Text('${todo.nome}')),
                    Expanded(flex: 2, child: Text('${todo.informacoes}')),
                    Expanded(flex: 3, child: Text('${todo.endereco}'))
                  ]),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 0.5,
                  height: 0.5,
                );
              },
              itemCount: eletropostos.length,
            );
          }
          return Container();
        },
      ),
    );
  }
}
