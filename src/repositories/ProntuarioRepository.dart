import 'package:injectable/injectable.dart';
import 'BaseRepository.dart';

@injectable
class ProntuarioRepository extends BaseRepository {
  
  ProntuarioRepository(super.databaseConfig);
  
  // Exemplo: Buscar prontuários por paciente
  Future<List<Map<String, dynamic>>> buscarProntuariosPorPaciente(int pacienteId) async {
    const query = '''
      SELECT 
        p.*,
        m.nome as medico_nome,
        m.crm,
        e.nome as especialidade_nome
      FROM prontuarios p
      JOIN medicos m ON p.medico_id = m.id
      JOIN especialidades e ON m.especialidade_id = e.id
      WHERE p.paciente_id = @pacienteId
      ORDER BY p.created_at DESC
    ''';
    
    return await executeQuery(query, {'pacienteId': pacienteId});
  }
}
