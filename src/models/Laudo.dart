class Laudo {
  String? _descricao;          // Obrigatório - laudo deve ter descrição
  DateTime? _dataEmissao;      // Obrigatório - sempre tem data de emissão
  String? _medicoId;           // Obrigatório - laudo deve ter médico responsável
  String? _exameId;            // Obrigatório - laudo deve ter exame associado
  String? _pacienteId;         // Obrigatório - laudo deve ter paciente
  String? _status;             // Obrigatório - status do laudo

  // Construtor privado
  Laudo._();

  // Builder class
  static LaudoBuilder builder() {
    return LaudoBuilder();
  }

  // Getters
  String? get descricao => _descricao;
  DateTime? get dataEmissao => _dataEmissao;
  String? get medicoId => _medicoId;
  String? get exameId => _exameId;
  String? get pacienteId => _pacienteId;
  String? get status => _status;

  // Setters
  set descricao(String? value) => _descricao = value;
  set dataEmissao(DateTime? value) => _dataEmissao = value;
  set medicoId(String? value) => _medicoId = value;
  set exameId(String? value) => _exameId = value;
  set pacienteId(String? value) => _pacienteId = value;
  set status(String? value) => _status = value;

  @override
  String toString() {
    return 'descricao: $_descricao, dataEmissao: $_dataEmissao, medicoId: $_medicoId, exameId: $_exameId, pacienteId: $_pacienteId, status: $_status}';
  }
}

// Builder class para Laudo
class LaudoBuilder {
  final Laudo _laudo = Laudo._();

  LaudoBuilder descricao(String? descricao) {
    _laudo._descricao = descricao;
    return this;
  }

  LaudoBuilder dataEmissao(DateTime? dataEmissao) {
    _laudo._dataEmissao = dataEmissao;
    return this;
  }

  LaudoBuilder medicoId(String? medicoId) {
    _laudo._medicoId = medicoId;
    return this;
  }

  LaudoBuilder exameId(String? exameId) {
    _laudo._exameId = exameId;
    return this;
  }

  LaudoBuilder pacienteId(String? pacienteId) {
    _laudo._pacienteId = pacienteId;
    return this;
  }

  LaudoBuilder status(String? status) {
    _laudo._status = status;
    return this;
  }

  Laudo build() {
    // Validações obrigatórias
    if (_laudo._descricao == null || _laudo._descricao!.isEmpty) {
      throw ArgumentError('Descrição do laudo é obrigatória');
    }
    if (_laudo._medicoId == null || _laudo._medicoId!.isEmpty) {
      throw ArgumentError('ID do médico é obrigatório');
    }
    if (_laudo._exameId == null || _laudo._exameId!.isEmpty) {
      throw ArgumentError('ID do exame é obrigatório');
    }
    if (_laudo._pacienteId == null || _laudo._pacienteId!.isEmpty) {
      throw ArgumentError('ID do paciente é obrigatório');
    }
    if (_laudo._dataEmissao == null) {
      _laudo._dataEmissao = DateTime.now();
    }
    if (_laudo._status == null || _laudo._status!.isEmpty) {
      _laudo._status = 'Pendente'; // Status padrão
    }
    
    return _laudo;
  }
}
