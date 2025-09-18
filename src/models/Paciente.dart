class Paciente {
  int? _idPaciente;
  String? _nomeCompleto;        // Obrigatório - identificação do paciente
  DateTime? _dataNascimento;    // Obrigatório - idade é importante para medicina
  String? _cpf;                 // Obrigatório - identificação única
  String? _email;              // Opcional - pode não ter email
  String? _telefone;           // Opcional - pode não ter telefone
  String? _endereco;           // Opcional - pode não ter endereço

  // Construtor privado
  Paciente._();

  // Builder class
  static PacienteBuilder builder() {
    return PacienteBuilder();
  }

  // Getters
  int? get idPaciente => _idPaciente;
  String? get nomeCompleto => _nomeCompleto;
  DateTime? get dataNascimento => _dataNascimento;
  String? get cpf => _cpf;
  String? get email => _email;
  String? get telefone => _telefone;
  String? get endereco => _endereco;

  // Setters
  set idPaciente(int? value) => _idPaciente = value;
  set nomeCompleto(String? value) => _nomeCompleto = value;
  set dataNascimento(DateTime? value) => _dataNascimento = value;
  set cpf(String? value) => _cpf = value;
  set email(String? value) => _email = value;
  set telefone(String? value) => _telefone = value;
  set endereco(String? value) => _endereco = value;

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
    return 'Paciente{idPaciente: $_idPaciente, nomeCompleto: $_nomeCompleto, dataNascimento: $_dataNascimento, cpf: $_cpf, email: $_email, telefone: $_telefone, endereco: $_endereco}';
  }
}

// Builder class para Paciente
class PacienteBuilder {
  final Paciente _paciente = Paciente._();

  PacienteBuilder idPaciente(int? idPaciente) {
    _paciente._idPaciente = idPaciente;
    return this;
  }

  PacienteBuilder nomeCompleto(String? nomeCompleto) {
    _paciente._nomeCompleto = nomeCompleto;
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

  Paciente build() {
    // Validações obrigatórias
    if (_paciente._nomeCompleto == null || _paciente._nomeCompleto!.isEmpty) {
      throw ArgumentError('Nome completo é obrigatório');
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
