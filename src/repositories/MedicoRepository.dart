import 'package:injectable/injectable.dart';
import 'BaseRepository.dart';

@injectable
class MedicoRepository extends BaseRepository {
  
  MedicoRepository(super.databaseConfig);
  
  // Exemplo: Buscar médico por ID
  Future<Map<String, dynamic>?> buscarMedicoPorId(int id) async {
    const query = '''
      SELECT m.*, e.nome as especialidade_nome
      FROM medicos m
      JOIN especialidades e ON m.especialidade_id = e.id
      WHERE m.id = @id
    ''';
    
    final result = await executeQuery(query, {'id': id});
    return result.isNotEmpty ? result.first : null;
  }
}
