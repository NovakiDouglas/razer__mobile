import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ConnectionFactory {
  final int _version = 1;
  final String _databaseFile = "database.db";
  ConnectionFactory._();
  static final ConnectionFactory factory = ConnectionFactory._();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await openDatabase(
      join(await getDatabasesPath(), _databaseFile),
      onCreate: _createDatabase,
      onUpgrade: _upgradeDatabase,
      version: _version,
    );
    return database;
  }

  _createDatabase(Database db, int version) {
    return db.execute(
      "CREATE TABLE tb_cliente (cliente_id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "cliente_nome TEXT, cliente_sobrenome TEXT, cliente_cpf TEXT)",
    );
  }

  _upgradeDatabase(Database db, int oldVersion, int newVersion) {
    db.execute("DROP TABLE tb_cliente");
    return _createDatabase(db, _version);
  }

  close() {
    if (_database != null) {
      _database!.close();
      _database = null;
    }
  }
}
