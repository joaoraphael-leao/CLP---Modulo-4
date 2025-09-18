import '../models/Paciente.dart';

class PacienteService {
  // Lista para simular armazenamento em memória
  static List<Paciente> _pacientes = [];

  // Criar novo paciente
  static Future<Paciente> criarPaciente(Paciente paciente) async {
    paciente.id = DateTime.now().millisecondsSinceEpoch.toString();
    _pacientes.add(paciente);
    return paciente;
  }

  // Buscar paciente por ID
  static Future<Paciente?> buscarPorId(String id) async {
    try {
      return _pacientes.firstWhere((paciente) => paciente.id == id);
    } catch (e) {
      return null;
    }
  }

  // Listar todos os pacientes
  static Future<List<Paciente>> listarPacientes() async {
    return List.from(_pacientes);
  }

  // Atualizar paciente
  static Future<Paciente?> atualizarPaciente(Paciente pacienteAtualizado) async {
    final index = _pacientes.indexWhere((p) => p.id == pacienteAtualizado.id);
    if (index != -1) {
      _pacientes[index] = pacienteAtualizado;
      return pacienteAtualizado;
    }
    return null;
  }

  // Deletar paciente
  static Future<bool> deletarPaciente(String id) async {
    final index = _pacientes.indexWhere((p) => p.id == id);
    if (index != -1) {
      _pacientes.removeAt(index);
      return true;
    }
    return false;
  }

  // Buscar paciente por CPF
  static Future<Paciente?> buscarPorCPF(String cpf) async {
    try {
      return _pacientes.firstWhere((p) => p.cpf == cpf);
    } catch (e) {
      return null;
    }
  }

  // Buscar pacientes por nome
  static Future<List<Paciente>> buscarPorNome(String nome) async {
    return _pacientes.where((p) => 
      p.nome.toLowerCase().contains(nome.toLowerCase())
    ).toList();
  }

  // Buscar pacientes por data de nascimento
  static Future<List<Paciente>> buscarPorDataNascimento(DateTime dataNascimento) async {
    return _pacientes.where((p) => 
      p.dataNascimento.year == dataNascimento.year && 
      p.dataNascimento.month == dataNascimento.month && 
      p.dataNascimento.day == dataNascimento.day
    ).toList();
  }

  // Buscar pacientes por idade
  static Future<List<Paciente>> buscarPorIdade(int idade) async {
    final dataAtual = DateTime.now();
    return _pacientes.where((p) {
      final idadeCalculada = dataAtual.year - p.dataNascimento.year;
      return idadeCalculada == idade;
    }).toList();
  }
}

