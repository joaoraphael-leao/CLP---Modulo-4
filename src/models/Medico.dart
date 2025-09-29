class Medico {
  String? _nome;               // Obrigatório - identificação do médico
  String? _crm;                 // Obrigatório - registro profissional
  String? _especialidadeId;     // Obrigatório - especialidade do médico
  bool? _ativo;                 // Obrigatório - status do médico
  String? _telefone;           // Opcional - pode não ter telefone
  String? _localAtendimento;   // Opcional - pode não ter local definido
  int? _agendaId;              // Opcional - pode não ter agenda
  double? _tempoPadraoConsulta; // Opcional - pode usar padrão do sistema

  // Construtor privado
  Medico._();

  // Builder class
  static MedicoBuilder builder() {
    return MedicoBuilder();
  }

  // Getters
  String? get nome => _nome;
  String? get crm => _crm;
  String? get especialidadeId => _especialidadeId;
  bool? get ativo => _ativo;
  String? get telefone => _telefone;
  String? get localAtendimento => _localAtendimento;
  int? get agendaId => _agendaId;
  double? get tempoPadraoConsulta => _tempoPadraoConsulta;

  // Setters
  set nome(String? value) => _nome = value;
  set crm(String? value) => _crm = value;
  set especialidadeId(String? value) => _especialidadeId = value;
  set ativo(bool? value) => _ativo = value;
  set telefone(String? value) => _telefone = value;
  set localAtendimento(String? value) => _localAtendimento = value;
  set agendaId(int? value) => _agendaId = value;
  set tempoPadraoConsulta(double? value) => _tempoPadraoConsulta = value;

  // Método para definir especialidade
  void definirEspecialidade(String especialidadeId) {
    _especialidadeId = especialidadeId;
  }

  @override
  String toString() {
    return 'Medico{nome: $_nome, crm: $_crm, especialidadeId: $_especialidadeId, ativo: $_ativo, telefone: $_telefone, localAtendimento: $_localAtendimento, agendaId: $_agendaId, tempoPadraoConsulta: $_tempoPadraoConsulta}';
  }
}

// Builder class para Medico
class MedicoBuilder {
  final Medico _medico = Medico._();

  MedicoBuilder nome(String? nome) {
    _medico._nome = nome;
    return this;
  }

  MedicoBuilder crm(String? crm) {
    _medico._crm = crm;
    return this;
  }

  MedicoBuilder especialidadeId(String? especialidadeId) {
    _medico._especialidadeId = especialidadeId;
    return this;
  }

  MedicoBuilder ativo(bool? ativo) {
    _medico._ativo = ativo;
    return this;
  }

  MedicoBuilder telefone(String? telefone) {
    _medico._telefone = telefone;
    return this;
  }

  MedicoBuilder localAtendimento(String? localAtendimento) {
    _medico._localAtendimento = localAtendimento;
    return this;
  }

  MedicoBuilder agendaId(int? agendaId) {
    _medico._agendaId = agendaId;
    return this;
  }

  MedicoBuilder tempoPadraoConsulta(double? tempoPadraoConsulta) {
    _medico._tempoPadraoConsulta = tempoPadraoConsulta;
    return this;
  }

  Medico build() {
    // Validações obrigatórias
    if (_medico._nome == null || _medico._nome!.isEmpty) {
      throw ArgumentError('Nome é obrigatório');
    }
    if (_medico._crm == null || _medico._crm!.isEmpty) {
      throw ArgumentError('CRM é obrigatório');
    }
    if (_medico._especialidadeId == null || _medico._especialidadeId!.isEmpty) {
      throw ArgumentError('Especialidade é obrigatória');
    }
    if (_medico._ativo == null) {
      _medico._ativo = true; // Padrão ativo
    }
    
    return _medico;
  }
}
