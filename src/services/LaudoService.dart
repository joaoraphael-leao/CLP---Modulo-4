import '../models/Laudo.dart';

class LaudoService {
  // Lista para simular armazenamento em memória
  static List<Laudo> _laudos = [];

  // Criar novo laudo
  static Future<Laudo> criarLaudo(Laudo laudo) async {
    laudo.id = DateTime.now().millisecondsSinceEpoch.toString();
    _laudos.add(laudo);
    return laudo;
  }

  // Buscar laudo por ID
  static Future<Laudo?> buscarPorId(String id) async {
    try {
      return _laudos.firstWhere((laudo) => laudo.id == id);
    } catch (e) {
      return null;
    }
  }

  // Listar todos os laudos
  static Future<List<Laudo>> listarLaudos() async {
    return List.from(_laudos);
  }

  // Atualizar laudo
  static Future<Laudo?> atualizarLaudo(Laudo laudoAtualizado) async {
    final index = _laudos.indexWhere((l) => l.id == laudoAtualizado.id);
    if (index != -1) {
      _laudos[index] = laudoAtualizado;
      return laudoAtualizado;
    }
    return null;
  }

  // Deletar laudo
  static Future<bool> deletarLaudo(String id) async {
    final index = _laudos.indexWhere((l) => l.id == id);
    if (index != -1) {
      _laudos.removeAt(index);
      return true;
    }
    return false;
  }

  // Buscar laudos por exame
  static Future<List<Laudo>> buscarPorExame(String exameId) async {
    return _laudos.where((l) => l.exameId == exameId).toList();
  }

  // Buscar laudos por médico
  static Future<List<Laudo>> buscarPorMedico(String medicoId) async {
    return _laudos.where((l) => l.medicoId == medicoId).toList();
  }

  // Buscar laudos por paciente
  static Future<List<Laudo>> buscarPorPaciente(String pacienteId) async {
    return _laudos.where((l) => l.pacienteId == pacienteId).toList();
  }

  // Buscar laudos por status
  static Future<List<Laudo>> buscarPorStatus(String status) async {
    return _laudos.where((l) => l.status == status).toList();
  }

  // Buscar laudos por data
  static Future<List<Laudo>> buscarPorData(DateTime data) async {
    return _laudos.where((l) => 
      l.dataEmissao.year == data.year && 
      l.dataEmissao.month == data.month && 
      l.dataEmissao.day == data.day
    ).toList();
  }
}

