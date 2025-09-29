import 'dart:io';
import '../utils/DatabaseConfig.dart';

class MigrationRunner {
  final DatabaseConfig _databaseConfig;
  
  MigrationRunner(this._databaseConfig);
  
  // Executar todas as migrações
  Future<void> runMigrations() async {
    print('🚀 Iniciando execução das migrações...');
    
    try {
      final connection = await _databaseConfig.openConnection();
      
      // Ler e executar arquivo de migração
      final migrationFile = File('src/migrations/001_create_tables.sql');
      if (await migrationFile.exists()) {
        final migrationSQL = await migrationFile.readAsString();
        
        print('📄 Executando migração: 001_create_tables.sql');
        await connection.execute(migrationSQL);
        
        print('✅ Migração executada com sucesso!');
      } else {
        print('❌ Arquivo de migração não encontrado!');
      }
      
      await connection.close();
      
    } catch (e) {
      print('❌ Erro ao executar migrações: $e');
      rethrow;
    }
  }
  
  // Verificar se as tabelas existem
  Future<bool> checkTablesExist() async {
    try {
      final connection = await _databaseConfig.openConnection();
      
      final result = await connection.execute('''
        SELECT COUNT(*) as table_count
        FROM information_schema.tables 
        WHERE table_schema = 'public' 
        AND table_name IN (
          'especialidades', 'medicos', 'pacientes', 'consultas', 
          'exames', 'imagens', 'laudos', 'prontuarios', 
          'prontuario_entradas', 'notificacoes', 'log_notificacoes', 
          'alertas_criticos', 'agenda_ocupada'
        )
      ''');
      
      final tableCount = result.first[0] as int;
      await connection.close();
      
      return tableCount == 13; // Número esperado de tabelas
      
    } catch (e) {
      print('❌ Erro ao verificar tabelas: $e');
      return false;
    }
  }
  
  // Listar tabelas existentes
  Future<List<String>> listTables() async {
    try {
      final connection = await _databaseConfig.openConnection();
      
      final result = await connection.execute('''
        SELECT table_name
        FROM information_schema.tables 
        WHERE table_schema = 'public'
        ORDER BY table_name
      ''');
      
      final tables = result.map((row) => row[0] as String).toList();
      await connection.close();
      
      return tables;
      
    } catch (e) {
      print('❌ Erro ao listar tabelas: $e');
      return [];
    }
  }
  
  // Executar migração específica
  Future<void> runMigration(String migrationFile) async {
    try {
      final connection = await _databaseConfig.openConnection();
      
      final file = File('src/migrations/$migrationFile');
      if (await file.exists()) {
        final migrationSQL = await file.readAsString();
        
        print('📄 Executando migração: $migrationFile');
        await connection.execute(migrationSQL);
        
        print('✅ Migração $migrationFile executada com sucesso!');
      } else {
        print('❌ Arquivo de migração $migrationFile não encontrado!');
      }
      
      await connection.close();
      
    } catch (e) {
      print('❌ Erro ao executar migração $migrationFile: $e');
      rethrow;
    }
  }
}
