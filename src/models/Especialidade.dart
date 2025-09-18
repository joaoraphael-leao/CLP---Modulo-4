class Especialidade {
  // Underline torna Publico
  int? _idEspecialidade;
  String? _nome;
  String? _descricao;
  String? _requisitos;

  // Construtor
  Especialidade({
    int? idEspecialidade,
    String? nome,
    String? descricao,
    String? requisitos,
  }) {
    _idEspecialidade = idEspecialidade;
    _nome = nome;
    _descricao = descricao;
    _requisitos = requisitos;
  }

  // Getters
  int? get idEspecialidade => _idEspecialidade;
  String? get nome => _nome;
  String? get descricao => _descricao;
  String? get requisitos => _requisitos;

  // Setters
  set idEspecialidade(int? value) => _idEspecialidade = value;
  set nome(String? value) => _nome = value;
  set descricao(String? value) => _descricao = value;
  set requisitos(String? value) => _requisitos = value;

  @override
  String toString() {
    return 'Especialidade{idEspecialidade: $_idEspecialidade, nome: $_nome, descricao: $_descricao, requisitos: $_requisitos}';
  }
}

// Builder class para Especialidade
class EspecialidadeBuilder {
  final Especialidade _especialidade = Especialidade._();

  EspecialidadeBuilder idEspecialidade(int? idEspecialidade) {
    _especialidade._idEspecialidade = idEspecialidade;
    return this;
  }

  EspecialidadeBuilder nome(String? nome) {
    _especialidade._nome = nome;
    return this;
  }

  EspecialidadeBuilder descricao(String? descricao) {
    _especialidade._descricao = descricao;
    return this;
  }

  EspecialidadeBuilder requisitos(String? requisitos) {
    _especialidade._requisitos = requisitos;
    return this;
  }

  Especialidade build() {
    // Validações obrigatórias
    if (_especialidade._nome == null || _especialidade._nome!.isEmpty) {
      throw ArgumentError('Nome da especialidade é obrigatório');
    }
    
    return _especialidade;
  }
}
