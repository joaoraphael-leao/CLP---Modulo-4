import 'package:injectable/injectable.dart';
import 'BaseRepository.dart';

@injectable
class LaudoRepository extends BaseRepository {
  
  LaudoRepository(super.databaseConfig);
  
  // Exemplo: Buscar laudos por exame
  Future<List<Map<String, dynamic>>> buscarLaudosPorExame(int exameId) async {
    const query = '''
      SELECT 
        l.*,
        m.nome as medico_nome,
        m.crm
      FROM laudos l
      JOIN medicos m ON l.medico_id = m.id
      WHERE l.exame_id = @exameId
      ORDER BY l.created_at DESC
    ''';
    
    return await executeQuery(query, {'exameId': exameId});
  }
}
