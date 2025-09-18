class Paciente {
  String? _id;
  String? _nome;               // Obrigatório - identificação do paciente
  DateTime? _dataNascimento;    // Obrigatório - idade é importante para medicina
  String? _cpf;                 // Obrigatório - identificação única
  String? _email;              // Opcional - pode não ter email
  String? _telefone;           // Opcional - pode não ter telefone
  String? _endereco;           // Opcional - pode não ter endereço
  bool? _internado;            // Opcional - indica se o paciente está internado

  // Construtor privado
  Paciente._();

  // Builder class
  static PacienteBuilder builder() {
    return PacienteBuilder();
  }

  // Getters
  String? get id => _id;
  String? get nome => _nome;
  DateTime? get dataNascimento => _dataNascimento;
  String? get cpf => _cpf;
  String? get email => _email;
  String? get telefone => _telefone;
  String? get endereco => _endereco;
  bool? get internado => _internado;

  // Setters
  set id(String? value) => _id = value;
  set nome(String? value) => _nome = value;
  set dataNascimento(DateTime? value) => _dataNascimento = value;
  set cpf(String? value) => _cpf = value;
  set email(String? value) => _email = value;
  set telefone(String? value) => _telefone = value;
  set endereco(String? value) => _endereco = value;
  set internado(bool? value) => _internado = value;

  // Método para calcular idade
  int? calcularIdade() {
    if (_dataNascimento == null) return null;
    
    final hoje = DateTime.now();
    int idade = hoje.year - _dataNascimento!.year;
    
    if (hoje.month < _dataNascimento!.month || 
        (hoje.month == _dataNascimento!.month && hoje.day < _dataNascimento!.day)) {
      idade--;
    }
    
    return idade;
  }

  @override
  String toString() {
    return 'Paciente{id: $_id, nome: $_nome, dataNascimento: $_dataNascimento, cpf: $_cpf, email: $_email, telefone: $_telefone, endereco: $_endereco, internado: $_internado}';
  }
}

// Builder class para Paciente
class PacienteBuilder {
  final Paciente _paciente = Paciente._();

  PacienteBuilder id(String? id) {
    _paciente._id = id;
    return this;
  }

  PacienteBuilder nome(String? nome) {
    _paciente._nome = nome;
    return this;
  }

  PacienteBuilder dataNascimento(DateTime? dataNascimento) {
    _paciente._dataNascimento = dataNascimento;
    return this;
  }

  PacienteBuilder cpf(String? cpf) {
    _paciente._cpf = cpf;
    return this;
  }

  PacienteBuilder email(String? email) {
    _paciente._email = email;
    return this;
  }

  PacienteBuilder telefone(String? telefone) {
    _paciente._telefone = telefone;
    return this;
  }

  PacienteBuilder endereco(String? endereco) {
    _paciente._endereco = endereco;
    return this;
  }

  PacienteBuilder internado(bool? internado) {
    _paciente._internado = internado;
    return this;
  }

  Paciente build() {
    // Validações obrigatórias
    if (_paciente._nome == null || _paciente._nome!.isEmpty) {
      throw ArgumentError('Nome é obrigatório');
    }
    if (_paciente._dataNascimento == null) {
      throw ArgumentError('Data de nascimento é obrigatória');
    }
    if (_paciente._cpf == null || _paciente._cpf!.isEmpty) {
      throw ArgumentError('CPF é obrigatório');
    }
    
    return _paciente;
  }
}
