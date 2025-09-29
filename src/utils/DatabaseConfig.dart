import 'package:postgres/postgres.dart';
import 'package:injectable/injectable.dart';

@singleton
class DatabaseConfig {
  
  Future<Connection> openConnection() async {

    final connection = await Connection.open(Endpoint(
        host: 'localhost',
        database: 'postgres',
        username: 'user',
        password: 'pass',
      )); 

    return connection;
  }

}

