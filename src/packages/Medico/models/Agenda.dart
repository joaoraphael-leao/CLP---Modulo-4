class Agenda {
  int? _idAgenda;
  int? _medicoId;              // Obrigatório - agenda deve ter médico
  DateTime? _dataAgenda;       // Obrigatório - agenda deve ter data

  // Construtor privado
  Agenda._();

  // Builder class
  static AgendaBuilder builder() {
    return AgendaBuilder();
  }

  // Getters
  int? get idAgenda => _idAgenda;
  int? get medicoId => _medicoId;
  DateTime? get dataAgenda => _dataAgenda;

  // Setters
  set idAgenda(int? value) => _idAgenda = value;
  set medicoId(int? value) => _medicoId = value;
  set dataAgenda(DateTime? value) => _dataAgenda = value;

  @override
  String toString() {
    return 'Agenda{idAgenda: $_idAgenda, medicoId: $_medicoId, dataAgenda: $_dataAgenda}';
  }
}

// Builder class para Agenda
class AgendaBuilder {
  final Agenda _agenda = Agenda._();

  AgendaBuilder idAgenda(int? idAgenda) {
    _agenda._idAgenda = idAgenda;
    return this;
  }

  AgendaBuilder medicoId(int? medicoId) {
    _agenda._medicoId = medicoId;
    return this;
  }

  AgendaBuilder dataAgenda(DateTime? dataAgenda) {
    _agenda._dataAgenda = dataAgenda;
    return this;
  }

  Agenda build() {
    // Validações obrigatórias
    if (_agenda._medicoId == null || _agenda._medicoId! <= 0) {
      throw ArgumentError('ID do médico é obrigatório e deve ser maior que zero');
    }
    if (_agenda._dataAgenda == null) {
      throw ArgumentError('Data da agenda é obrigatória');
    }
    
    return _agenda;
  }
}
