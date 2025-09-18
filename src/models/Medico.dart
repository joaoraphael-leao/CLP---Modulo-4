class Medico {
  int? _idMedico;
  String? _nomeCompleto;        // Obrigatório - identificação do médico
  String? _crm;                 // Obrigatório - registro profissional
  List<String>? _especialidades; // Obrigatório - pelo menos uma especialidade
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
  int? get idMedico => _idMedico;
  String? get nomeCompleto => _nomeCompleto;
  String? get crm => _crm;
  List<String>? get especialidades => _especialidades;
  String? get telefone => _telefone;
  String? get localAtendimento => _localAtendimento;
  int? get agendaId => _agendaId;
  double? get tempoPadraoConsulta => _tempoPadraoConsulta;

  // Setters
  set idMedico(int? value) => _idMedico = value;
  set nomeCompleto(String? value) => _nomeCompleto = value;
  set crm(String? value) => _crm = value;
  set especialidades(List<String>? value) => _especialidades = value;
  set telefone(String? value) => _telefone = value;
  set localAtendimento(String? value) => _localAtendimento = value;
  set agendaId(int? value) => _agendaId = value;
  set tempoPadraoConsulta(double? value) => _tempoPadraoConsulta = value;

  // Método para adicionar especialidade
  void adicionarEspecialidade(String especialidade) {
    _especialidades ??= [];
    _especialidades!.add(especialidade);
  }

  // Método para remover especialidade
  void removerEspecialidade(String especialidade) {
    _especialidades?.remove(especialidade);
  }

  @override
  String toString() {
    return 'Medico{idMedico: $_idMedico, nomeCompleto: $_nomeCompleto, crm: $_crm, especialidades: $_especialidades, telefone: $_telefone, localAtendimento: $_localAtendimento, agendaId: $_agendaId, tempoPadraoConsulta: $_tempoPadraoConsulta}';
  }
}

// Builder class para Medico
class MedicoBuilder {
  final Medico _medico = Medico._();

  MedicoBuilder idMedico(int? idMedico) {
    _medico._idMedico = idMedico;
    return this;
  }

  MedicoBuilder nomeCompleto(String? nomeCompleto) {
    _medico._nomeCompleto = nomeCompleto;
    return this;
  }

  MedicoBuilder crm(String? crm) {
    _medico._crm = crm;
    return this;
  }

  MedicoBuilder especialidades(List<String>? especialidades) {
    _medico._especialidades = especialidades;
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
    if (_medico._nomeCompleto == null || _medico._nomeCompleto!.isEmpty) {
      throw ArgumentError('Nome completo é obrigatório');
    }
    if (_medico._crm == null || _medico._crm!.isEmpty) {
      throw ArgumentError('CRM é obrigatório');
    }
    if (_medico._especialidades == null || _medico._especialidades!.isEmpty) {
      throw ArgumentError('Pelo menos uma especialidade é obrigatória');
    }
    
    return _medico;
  }
}
