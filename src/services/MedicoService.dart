import '../models/Medico.dart';

class MedicoService {
  // Lista para simular armazenamento em memória
  static List<Medico> _medicos = [];

  // Criar novo médico
  static Future<Medico> criarMedico(Medico medico) async {
    medico.id = DateTime.now().millisecondsSinceEpoch.toString();
    _medicos.add(medico);
    return medico;
  }

  // Buscar médico por ID
  static Future<Medico?> buscarPorId(String id) async {
    try {
      return _medicos.firstWhere((medico) => medico.id == id);
    } catch (e) {
      return null;
    }
  }

  // Listar todos os médicos
  static Future<List<Medico>> listarMedicos() async {
    return List.from(_medicos);
  }

  // Atualizar médico
  static Future<Medico?> atualizarMedico(Medico medicoAtualizado) async {
    final index = _medicos.indexWhere((m) => m.id == medicoAtualizado.id);
    if (index != -1) {
      _medicos[index] = medicoAtualizado;
      return medicoAtualizado;
    }
    return null;
  }

  // Deletar médico
  static Future<bool> deletarMedico(String id) async {
    final index = _medicos.indexWhere((m) => m.id == id);
    if (index != -1) {
      _medicos.removeAt(index);
      return true;
    }
    return false;
  }

  // Buscar médico por CRM
  static Future<Medico?> buscarPorCRM(String crm) async {
    try {
      return _medicos.firstWhere((m) => m.crm == crm);
    } catch (e) {
      return null;
    }
  }

  // Buscar médicos por especialidade
  static Future<List<Medico>> buscarPorEspecialidade(String especialidadeId) async {
    return _medicos.where((m) => m.especialidadeId == especialidadeId).toList();
  }

  // Buscar médicos por nome
  static Future<List<Medico>> buscarPorNome(String nome) async {
    return _medicos.where((m) => 
      m.nome.toLowerCase().contains(nome.toLowerCase())
    ).toList();
  }

  // Buscar médicos ativos
  static Future<List<Medico>> buscarAtivos() async {
    return _medicos.where((m) => m.ativo == true).toList();
  }
}

