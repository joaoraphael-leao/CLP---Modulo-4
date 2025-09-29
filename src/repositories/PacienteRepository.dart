import 'package:injectable/injectable.dart';
import 'BaseRepository.dart';

@injectable
class PacienteRepository extends BaseRepository {
  
  PacienteRepository(super.databaseConfig);
  
  // Exemplo: Buscar paciente por ID
  Future<Map<String, dynamic>?> buscarPacientePorId(int id) async {
    const query = '''
      SELECT * FROM pacientes WHERE id = @id
    ''';
    
    final result = await executeQuery(query, {'id': id});
    return result.isNotEmpty ? result.first : null;
  }
}
