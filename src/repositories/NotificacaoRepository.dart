import 'package:injectable/injectable.dart';
import 'BaseRepository.dart';

@injectable
class NotificacaoRepository extends BaseRepository {
  
  NotificacaoRepository(super.databaseConfig);
  
  // Exemplo: Buscar notificações por destinatário
  Future<List<Map<String, dynamic>>> buscarNotificacoesPorDestinatario(int destinatarioId) async {
    const query = '''
      SELECT * FROM notificacoes 
      WHERE destinatario_id = @destinatarioId
      ORDER BY created_at DESC
    ''';
    
    return await executeQuery(query, {'destinatarioId': destinatarioId});
  }
}
