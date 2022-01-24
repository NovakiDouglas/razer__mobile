import 'package:razer__mobile/model/cliente.dart';
import 'package:sqflite/sqflite.dart';

class ClienteDAO {
  Database database;
  ClienteDAO(this.database);
  Future<void> inserir(Cliente cliente) async {
    await database.insert(
      "tb_cliente",
      cliente.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Cliente>> obterTodos() async {
    final List<Map<String, dynamic>> maps = await database.query("tb_cliente");
    return Cliente.fromMaps(maps);
  }

  Future<Cliente?> obterPorId(int id) async {
    final List<Map<String, dynamic>> maps = await database
        .query("tb_cliente", where: "cliente_id = ?", whereArgs: [id]);
    if (maps.length > 0) {
      return Cliente.fromMap(maps.first);
    }
    return null;
  }

  Future<void> atualizar(Cliente cliente) async {
    await database.update(
      'tb_cliente',
      cliente.toMap(),
      where: "cliente_id = ?",
      whereArgs: [cliente.id],
    );
  }

  Future<void> remover(int id) async {}
}
