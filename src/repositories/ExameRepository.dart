import 'package:injectable/injectable.dart';
import 'BaseRepository.dart';

@injectable
class ExameRepository extends BaseRepository {
  
  ExameRepository(super.databaseConfig);
  
  Future<Map<String, dynamic>?> buscarExamePorId(int id) async {
    const query = '''
      SELECT e.*, p.nome as paciente_nome, m.nome as medico_nome
      FROM exames e
      JOIN pacientes p ON e.paciente_id = p.id
      JOIN medicos m ON e.medico_id = m.id
      WHERE e.id = @id
    ''';
    
    final result = await executeQuery(query, {'id': id});
    return result.isNotEmpty ? result.first : null;
  }
}
