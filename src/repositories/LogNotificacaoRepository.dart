import 'package:injectable/injectable.dart';
import 'BaseRepository.dart';

@injectable
class LogNotificacaoRepository extends BaseRepository {
  
  LogNotificacaoRepository(super.databaseConfig);
  
  // Exemplo: Buscar logs por usuário
  Future<List<Map<String, dynamic>>> buscarLogsPorUsuario(int usuarioId) async {
    const query = '''
      SELECT 
        ln.*,
        n.titulo as notificacao_titulo,
        n.tipo as notificacao_tipo
      FROM log_notificacoes ln
      JOIN notificacoes n ON ln.notificacao_id = n.id
      WHERE ln.usuario_id = @usuarioId
      ORDER BY ln.created_at DESC
    ''';
    
    return await executeQuery(query, {'usuarioId': usuarioId});
  }
}
