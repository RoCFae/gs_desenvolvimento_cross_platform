import 'package:gs_app/models/veiculos.dart';
import '../database/database_manager.dart';

class VeiculosRepository {
  Future<List<Veiculos>> listarVeiculos() async {
    final db = await DatabaseManager().getDatabase();
    final List<Map<String, dynamic>> rows = await db.rawQuery('''
          SELECT 
            veiculos.id, 
            veiculos.descricao,
            veiculos.placa,
            veiculos.identificacao
          FROM veiculos
''');
    return rows
        .map(
          (row) => Veiculos(
              id: row['id'],
              descricao: row['descricao'],
              placa: row['placa'],
              identificacao: row['identificacao']),
        )
        .toList();
  }

  Future<void> adicionarVeiculo(Veiculos veiculos) async {
    final db = await DatabaseManager().getDatabase();

    db.insert("veiculos", {
      "id": veiculos.id,
      "descricao": veiculos.descricao,
      "placa": veiculos.placa,
      "identificacao": veiculos.identificacao
    });
  }

  Future<void> removerVeiculo(int id) async {
    final db = await DatabaseManager().getDatabase();
    await db.delete('veiculos', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> editarVeiculos(Veiculos veiculos) async {
    final db = await DatabaseManager().getDatabase();
    return db.update(
        'veiculos',
        {
          "id": veiculos.id,
          "descricao": veiculos.descricao,
          "placa": veiculos.placa,
          "identificacao": veiculos.identificacao
        },
        where: 'id = ?',
        whereArgs: [veiculos.id]);
  }
}
