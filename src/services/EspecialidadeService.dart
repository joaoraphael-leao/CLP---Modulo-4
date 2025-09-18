import '../models/Especialidade.dart';

class EspecialidadeService {
  // Lista para simular armazenamento em memória
  static List<Especialidade> _especialidades = [];

  // Criar nova especialidade
  static Future<Especialidade> criarEspecialidade(Especialidade especialidade) async {
    especialidade.id = DateTime.now().millisecondsSinceEpoch.toString();
    _especialidades.add(especialidade);
    return especialidade;
  }

  // Buscar especialidade por ID
  static Future<Especialidade?> buscarPorId(String id) async {
    try {
      return _especialidades.firstWhere((especialidade) => especialidade.id == id);
    } catch (e) {
      return null;
    }
  }

  // Listar todas as especialidades
  static Future<List<Especialidade>> listarEspecialidades() async {
    return List.from(_especialidades);
  }

  // Atualizar especialidade
  static Future<Especialidade?> atualizarEspecialidade(Especialidade especialidadeAtualizada) async {
    final index = _especialidades.indexWhere((e) => e.id == especialidadeAtualizada.id);
    if (index != -1) {
      _especialidades[index] = especialidadeAtualizada;
      return especialidadeAtualizada;
    }
    return null;
  }

  // Deletar especialidade
  static Future<bool> deletarEspecialidade(String id) async {
    final index = _especialidades.indexWhere((e) => e.id == id);
    if (index != -1) {
      _especialidades.removeAt(index);
      return true;
    }
    return false;
  }

  // Buscar especialidade por nome
  static Future<List<Especialidade>> buscarPorNome(String nome) async {
    return _especialidades.where((e) => 
      e.nome.toLowerCase().contains(nome.toLowerCase())
    ).toList();
  }
}

