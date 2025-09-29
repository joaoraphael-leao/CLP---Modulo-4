import 'package:injectable/injectable.dart';
import 'BaseRepository.dart';

@injectable
class AlertaCriticoRepository extends BaseRepository {
  
  AlertaCriticoRepository(super.databaseConfig);
  
  // Exemplo: Buscar alertas críticos ativos
  Future<List<Map<String, dynamic>>> buscarAlertasCriticosAtivos() async {
    const query = '''
      SELECT 
        ac.*,
        p.nome as paciente_nome,
        p.cpf as paciente_cpf,
        m.nome as medico_nome,
        m.crm
      FROM alertas_criticos ac
      JOIN pacientes p ON ac.paciente_id = p.id
      JOIN medicos m ON ac.medico_id = m.id
      WHERE ac.status = 'ativo'
      ORDER BY ac.prioridade DESC, ac.created_at DESC
    ''';
    
    return await executeQuery(query);
  }
}
