import 'package:injectable/injectable.dart';
import 'BaseRepository.dart';

@injectable
class AgendaRepository extends BaseRepository {
  
  AgendaRepository(super.databaseConfig);
  
  // Exemplo: Visualizar agenda de um médico em uma data
  Future<List<Map<String, dynamic>>> visualizarAgenda(int medicoId, DateTime data) async {
    const query = '''
      SELECT 
        c.id,
        c.data_consulta,
        c.status,
        p.nome as paciente_nome,
        p.cpf as paciente_cpf
      FROM consultas c
      JOIN pacientes p ON c.paciente_id = p.id
      WHERE c.medico_id = @medicoId
      AND DATE(c.data_consulta) = @data
      ORDER BY c.data_consulta ASC
    ''';
    
    return await executeQuery(query, {
      'medicoId': medicoId,
      'data': data,
    });
  }
}
