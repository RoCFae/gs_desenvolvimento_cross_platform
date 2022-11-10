import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:gs_app/models/veiculos.dart';
import 'package:gs_app/repository/veiculo_repository.dart';
import 'package:intl/intl.dart';

class VeiculosCadastro extends StatefulWidget {
  Veiculos? veiculoParaEdicao;
  VeiculosCadastro({Key? key, this.veiculoParaEdicao}) : super(key: key);

  @override
  State<VeiculosCadastro> createState() => _VeiculosCadastroState();
}

class _VeiculosCadastroState extends State<VeiculosCadastro> {
  final _veiculosRepository = VeiculosRepository();

  final _descricaoController = TextEditingController();
  final _placaController = TextEditingController();
  final _identificacaoController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final veiculo = widget.veiculoParaEdicao;
    if (veiculo != null) {
      _placaController.text = veiculo.placa;
      _descricaoController.text = veiculo.descricao;
      _identificacaoController.text = veiculo.identificacao;
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Veículo'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildDescricao(),
                const SizedBox(height: 20),
                _buildPlaca(),
                const SizedBox(height: 20),
                _buildIdentificacao(),
                const SizedBox(height: 20),
                _buildButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Cadastrar'),
        ),
        onPressed: () async {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            final descricao = _descricaoController.text;
            final placa = _placaController.text;
            final identificacao = _identificacaoController.text;

            final veiculo = Veiculos(
              descricao: descricao,
              placa: placa,
              identificacao: identificacao,
            );

            try {
              if (widget.veiculoParaEdicao != null) {
                veiculo.id = widget.veiculoParaEdicao!.id;
                await _veiculosRepository.editarVeiculos(veiculo);
              } else {
                await _veiculosRepository.adicionarVeiculo(veiculo);
              }

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Veículo cadastrado!'),
              ));

              Navigator.of(context).pop(true);
            } catch (e) {
              Navigator.of(context).pop(false);
            }
          }
        },
      ),
    );
  }

  TextFormField _buildDescricao() {
    return TextFormField(
      controller: _descricaoController,
      decoration: const InputDecoration(
        hintText: 'Informe uma descrição para seu veículo!',
        labelText: 'Descrição',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.abc_outlined),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe uma Descrição';
        }
        if (value.length < 5 || value.length > 30) {
          return 'A Descrição deve entre 5 e 30 caracteres';
        }
        return null;
      },
    );
  }

  TextFormField _buildPlaca() {
    return TextFormField(
      controller: _placaController,
      decoration: const InputDecoration(
        hintText: 'Informe uma placa para seu veículo!',
        labelText: 'Placa',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.album_rounded),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe uma Placa';
        }
        if (value.length < 7 || value.length > 7) {
          return 'A Placa deve ter 7 caracteres';
        }
        return null;
      },
    );
  }

  TextFormField _buildIdentificacao() {
    return TextFormField(
      controller: _identificacaoController,
      decoration: const InputDecoration(
        hintText: 'Informe uma Identificação para seu veículo!',
        labelText: 'Identificação',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe uma Identificação';
        }
        if (value.length < 4 || value.length > 15) {
          return 'A Identificação deve entre 4 e 15 caracteres';
        }
        return null;
      },
    );
  }
}
