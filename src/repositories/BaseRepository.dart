import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import '../utils/DatabaseConfig.dart';

@injectable
class BaseRepository {
  
  final DatabaseConfig _databaseConfig;
  Connection? _connection;
  
  BaseRepository(this._databaseConfig);
  
  Future<Connection> get connection async {
    if (_connection == null) {
      _connection = await _databaseConfig.openConnection();
    }
    return _connection!;
  }
  
  // Método genérico para executar queries
  Future<List<Map<String, dynamic>>> executeQuery(String query, [Map<String, dynamic>? parameters]) async {
    final conn = await connection;
    final result = await conn.execute(Sql.named(query), parameters: parameters);
    
    return result.map((row) {
      final Map<String, dynamic> map = {};
      for (int i = 0; i < row.length; i++) {
        final columnName = result.schema.columns[i].columnName;
        if (columnName != null) {
          map[columnName] = row[i];
        }
      }
      return map;
    }).toList();
  }
  
  // Método para executar comandos (INSERT, UPDATE, DELETE)
  Future<int> executeCommand(String command, [Map<String, dynamic>? parameters]) async {
    final conn = await connection;
    final result = await conn.execute(Sql.named(command), parameters: parameters);
    return result.affectedRows;
  }
  
  // Método para executar transações
  Future<T> executeTransaction<T>(Future<T> Function(TxSession) transaction) async {
    final conn = await connection;
    return await conn.runTx((tx) => transaction(tx));
  }
}
