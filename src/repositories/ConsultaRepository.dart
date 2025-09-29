import 'package:injectable/injectable.dart';
import 'BaseRepository.dart';

@injectable
class ConsultaRepository extends BaseRepository {
  
  ConsultaRepository(super.databaseConfig);
  
  // Exemplo: Buscar consulta por ID
  Future<Map<String, dynamic>?> buscarConsultaPorId(int id) async {
    const query = '''
      SELECT c.*, p.nome as paciente_nome, m.nome as medico_nome
      FROM consultas c
      JOIN pacientes p ON c.paciente_id = p.id
      JOIN medicos m ON c.medico_id = m.id
      WHERE c.id = @id
    ''';
    
    final result = await executeQuery(query, {'id': id});
    return result.isNotEmpty ? result.first : null;
  }
}
