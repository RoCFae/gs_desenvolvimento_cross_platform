import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gs_app/models/veiculos.dart';
import 'package:gs_app/pages/veiculos_cadastro.dart';
import 'package:gs_app/repository/veiculo_repository.dart';
import 'package:gs_app/widgets/veiculo_item.dart';

class VeiculosListaPage extends StatefulWidget {
  const VeiculosListaPage({Key? key}) : super(key: key);

  @override
  State<VeiculosListaPage> createState() => _VeiculosListaPageState();
}

class _VeiculosListaPageState extends State<VeiculosListaPage> {
  final _veiculosRepository = VeiculosRepository();
  late Future<List<Veiculos>> _futureVeiculos;

  @override
  void initState() {
    carregarVeiculos();
    super.initState();
  }

  void carregarVeiculos() {
    _futureVeiculos = _veiculosRepository.listarVeiculos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Veículos')),
      body: FutureBuilder<List<Veiculos>>(
        future: _futureVeiculos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final veiculos = snapshot.data ?? [];
            return ListView.separated(
              itemCount: veiculos.length,
              itemBuilder: (context, index) {
                final veiculo = veiculos[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) async {
                          await _veiculosRepository.removerVeiculo(veiculo.id!);

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Lançamento removido com sucesso')));

                          setState(() {
                            veiculos.removeAt(index);
                          });
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Remover',
                      ),
                      SlidableAction(
                        onPressed: (context) async {
                          var success = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  VeiculosCadastro(
                                veiculoParaEdicao: veiculo,
                              ),
                            ),
                          ) as bool?;

                          if (success != null && success) {
                            setState(() {
                              carregarVeiculos();
                            });
                          }
                        },
                        backgroundColor: Colors.greenAccent,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Editar',
                      ),
                    ],
                  ),
                  child: VeiculoItem(veiculo: veiculo),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            bool? veiculoCadastrado = await Navigator.of(context)
                .pushNamed('/veiculo-cadastro') as bool?;

            if (veiculoCadastrado != null && veiculoCadastrado) {
              setState(() {
                carregarVeiculos();
              });
            }
          },
          child: const Icon(Icons.add)),
    );
  }
}
