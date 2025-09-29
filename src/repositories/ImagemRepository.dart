import 'package:injectable/injectable.dart';
import 'BaseRepository.dart';

@injectable
class ImagemRepository extends BaseRepository {
  
  ImagemRepository(super.databaseConfig);
  
  // Exemplo: Buscar imagens por exame
  Future<List<Map<String, dynamic>>> buscarImagensPorExame(int exameId) async {
    const query = '''
      SELECT i.*, e.tipo_exame
      FROM imagens i
      JOIN exames e ON i.exame_id = e.id
      WHERE i.exame_id = @exameId
      ORDER BY i.created_at ASC
    ''';
    
    return await executeQuery(query, {'exameId': exameId});
  }
}
