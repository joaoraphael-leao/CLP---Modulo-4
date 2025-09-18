class Especialidade {
  // Underline torna Publico
  String? _id;
  String? _nome;
  String? _descricao;
  String? _requisitos;

  // Construtor privado
  Especialidade._();

  // Builder class
  static EspecialidadeBuilder builder() {
    return EspecialidadeBuilder();
  }

  // Getters
  String? get id => _id;
  String? get nome => _nome;
  String? get descricao => _descricao;
  String? get requisitos => _requisitos;

  // Setters
  set id(String? value) => _id = value;
  set nome(String? value) => _nome = value;
  set descricao(String? value) => _descricao = value;
  set requisitos(String? value) => _requisitos = value;

  @override
  String toString() {
    return 'Especialidade{id: $_id, nome: $_nome, descricao: $_descricao, requisitos: $_requisitos}';
  }
}

// Builder class para Especialidade
class EspecialidadeBuilder {
  final Especialidade _especialidade = Especialidade._();

  EspecialidadeBuilder id(String? id) {
    _especialidade._id = id;
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
