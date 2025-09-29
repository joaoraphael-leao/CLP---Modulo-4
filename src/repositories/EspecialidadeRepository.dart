import 'package:injectable/injectable.dart';
import 'BaseRepository.dart';

@injectable
class EspecialidadeRepository extends BaseRepository {
  
  EspecialidadeRepository(super.databaseConfig);
  
  // Exemplo: Buscar especialidade por ID
  Future<Map<String, dynamic>?> buscarEspecialidadePorId(int id) async {
    const query = '''
      SELECT * FROM especialidades WHERE id = @id
    ''';
    
    final result = await executeQuery(query, {'id': id});
    return result.isNotEmpty ? result.first : null;
  }
}
