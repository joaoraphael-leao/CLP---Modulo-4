class Exame {
  int? _idExame;
  int? _idMedico;              // Obrigatório - exame deve ter médico solicitante
  int? _idPaciente;            // Obrigatório - exame deve ter paciente
  String? _tipoExame;          // Obrigatório - exame deve ter tipo
  DateTime? _dataExame;        // Obrigatório - exame deve ter data
  bool? _precisaDeImagem;      // Obrigatório - sempre tem valor (true/false)
  String? _resultadoExame;    // Opcional - resultado pode não estar pronto

  // Construtor privado
  Exame._();

  // Builder class
  static ExameBuilder builder() {
    return ExameBuilder();
  }

  // Getters
  int? get idExame => _idExame;
  int? get idMedico => _idMedico;
  int? get idPaciente => _idPaciente;
  String? get tipoExame => _tipoExame;
  DateTime? get dataExame => _dataExame;
  bool? get precisaDeImagem => _precisaDeImagem;
  String? get resultadoExame => _resultadoExame;

  // Setters
  set idExame(int? value) => _idExame = value;
  set idMedico(int? value) => _idMedico = value;
  set idPaciente(int? value) => _idPaciente = value;
  set tipoExame(String? value) => _tipoExame = value;
  set dataExame(DateTime? value) => _dataExame = value;
  set precisaDeImagem(bool? value) => _precisaDeImagem = value;
  set resultadoExame(String? value) => _resultadoExame = value;

  @override
  String toString() {
    return 'Exame{idExame: $_idExame, idMedico: $_idMedico, idPaciente: $_idPaciente, tipoExame: $_tipoExame, dataExame: $_dataExame, precisaDeImagem: $_precisaDeImagem, resultadoExame: $_resultadoExame}';
  }
}

// Builder class para Exame
class ExameBuilder {
  final Exame _exame = Exame._();

  ExameBuilder idExame(int? idExame) {
    _exame._idExame = idExame;
    return this;
  }

  ExameBuilder idMedico(int? idMedico) {
    _exame._idMedico = idMedico;
    return this;
  }

  ExameBuilder idPaciente(int? idPaciente) {
    _exame._idPaciente = idPaciente;
    return this;
  }

  ExameBuilder tipoExame(String? tipoExame) {
    _exame._tipoExame = tipoExame;
    return this;
  }

  ExameBuilder dataExame(DateTime? dataExame) {
    _exame._dataExame = dataExame;
    return this;
  }

  ExameBuilder precisaDeImagem(bool? precisaDeImagem) {
    _exame._precisaDeImagem = precisaDeImagem;
    return this;
  }

  ExameBuilder resultadoExame(String? resultadoExame) {
    _exame._resultadoExame = resultadoExame;
    return this;
  }

  Exame build() {
    // Validações obrigatórias
    if (_exame._idMedico == null || _exame._idMedico! <= 0) {
      throw ArgumentError('ID do médico é obrigatório e deve ser maior que zero');
    }
    if (_exame._idPaciente == null || _exame._idPaciente! <= 0) {
      throw ArgumentError('ID do paciente é obrigatório e deve ser maior que zero');
    }
    if (_exame._tipoExame == null || _exame._tipoExame!.isEmpty) {
      throw ArgumentError('Tipo do exame é obrigatório');
    }
    if (_exame._dataExame == null) {
      throw ArgumentError('Data do exame é obrigatória');
    }
    if (_exame._precisaDeImagem == null) {
      _exame._precisaDeImagem = false;
    }
    
    return _exame;
  }
}
