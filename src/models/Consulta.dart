class Consulta {
  DateTime? _dataConsulta;      // Obrigatório - consulta deve ter data
  int? _idPaciente;            // Obrigatório - consulta deve ter paciente
  int? _idMedico;              // Obrigatório - consulta deve ter médico
  String? _sintomas;          // Opcional - pode não ter sintomas ainda
  String? _diagnostico;       // Opcional - pode não ter diagnóstico ainda
  String? _prescricao;        // Opcional - pode não ter prescrição ainda
  DateTime? _dataCriacao;      // Obrigatório - sempre tem data de criação
  List<String>? _examesNecessarios; // Obrigatório - lista pode estar vazia

  // Construtor privado
  Consulta._();

  // Builder class
  static ConsultaBuilder builder() {
    return ConsultaBuilder();
  }

  // Getters
  DateTime? get dataConsulta => _dataConsulta;
  int? get idPaciente => _idPaciente;
  int? get idMedico => _idMedico;
  String? get sintomas => _sintomas;
  String? get diagnostico => _diagnostico;
  String? get prescricao => _prescricao;
  DateTime? get dataCriacao => _dataCriacao;
  List<String>? get examesNecessarios => _examesNecessarios;

  // Setters
  set dataConsulta(DateTime? value) => _dataConsulta = value;
  set idPaciente(int? value) => _idPaciente = value;
  set idMedico(int? value) => _idMedico = value;
  set sintomas(String? value) => _sintomas = value;
  set diagnostico(String? value) => _diagnostico = value;
  set prescricao(String? value) => _prescricao = value;
  set dataCriacao(DateTime? value) => _dataCriacao = value;
  set examesNecessarios(List<String>? value) => _examesNecessarios = value;

  // Método para adicionar exame necessário
  void adicionarExameNecessario(String exame) {
    _examesNecessarios ??= [];
    _examesNecessarios!.add(exame);
  }

  // Método para remover exame necessário
  void removerExameNecessario(String exame) {
    _examesNecessarios?.remove(exame);
  }

  @override
  String toString() {
    return 'Consulta{dataConsulta: $_dataConsulta, idPaciente: $_idPaciente, idMedico: $_idMedico, sintomas: $_sintomas, diagnostico: $_diagnostico, prescricao: $_prescricao, dataCriacao: $_dataCriacao, examesNecessarios: $_examesNecessarios}';
  }
}

// Builder class para Consulta
class ConsultaBuilder {
  final Consulta _consulta = Consulta._();

  ConsultaBuilder dataConsulta(DateTime? dataConsulta) {
    _consulta._dataConsulta = dataConsulta;
    return this;
  }

  ConsultaBuilder idPaciente(int? idPaciente) {
    _consulta._idPaciente = idPaciente;
    return this;
  }

  ConsultaBuilder idMedico(int? idMedico) {
    _consulta._idMedico = idMedico;
    return this;
  }

  ConsultaBuilder sintomas(String? sintomas) {
    _consulta._sintomas = sintomas;
    return this;
  }

  ConsultaBuilder diagnostico(String? diagnostico) {
    _consulta._diagnostico = diagnostico;
    return this;
  }

  ConsultaBuilder prescricao(String? prescricao) {
    _consulta._prescricao = prescricao;
    return this;
  }

  ConsultaBuilder dataCriacao(DateTime? dataCriacao) {
    _consulta._dataCriacao = dataCriacao;
    return this;
  }

  ConsultaBuilder examesNecessarios(List<String>? examesNecessarios) {
    _consulta._examesNecessarios = examesNecessarios;
    return this;
  }

  Consulta build() {
    // Validações obrigatórias
    if (_consulta._dataConsulta == null) {
      throw ArgumentError('Data da consulta é obrigatória');
    }
    if (_consulta._idPaciente == null || _consulta._idPaciente! <= 0) {
      throw ArgumentError('ID do paciente é obrigatório e deve ser maior que zero');
    }
    if (_consulta._idMedico == null || _consulta._idMedico! <= 0) {
      throw ArgumentError('ID do médico é obrigatório e deve ser maior que zero');
    }
    if (_consulta._dataCriacao == null) {
      _consulta._dataCriacao = DateTime.now();
    }
    if (_consulta._examesNecessarios == null) {
      _consulta._examesNecessarios = [];
    }
    
    return _consulta;
  }
}
