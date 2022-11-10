class Eletro {
  int? id;
  String? nome;
  String? informacoes;
  String? endereco;
  String? telefone;
  List<String>? conectores;

  Eletro(
      {this.id,
      this.nome,
      this.informacoes,
      this.endereco,
      this.telefone,
      this.conectores});

  Eletro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    informacoes = json['informacoes'];
    endereco = json['endereco'];
    telefone = json['telefone'];
    conectores = json['conectores'].cast<String>();
  }
}
