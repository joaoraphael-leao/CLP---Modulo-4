class Laudo {
  int? _idLaudo;
  String? _descricao;          // Obrigatório - laudo deve ter descrição
  DateTime? _dataEmissao;      // Obrigatório - sempre tem data de emissão
  int? _idMedico;             // Obrigatório - laudo deve ter médico responsável

  // Construtor privado
  Laudo._();

  // Builder class
  static LaudoBuilder builder() {
    return LaudoBuilder();
  }

  // Getters
  int? get idLaudo => _idLaudo;
  String? get descricao => _descricao;
  DateTime? get dataEmissao => _dataEmissao;
  int? get idMedico => _idMedico;

  // Setters
  set idLaudo(int? value) => _idLaudo = value;
  set descricao(String? value) => _descricao = value;
  set dataEmissao(DateTime? value) => _dataEmissao = value;
  set idMedico(int? value) => _idMedico = value;

  @override
  String toString() {
    return 'Laudo{idLaudo: $_idLaudo, descricao: $_descricao, dataEmissao: $_dataEmissao, idMedico: $_idMedico}';
  }
}

// Builder class para Laudo
class LaudoBuilder {
  final Laudo _laudo = Laudo._();

  LaudoBuilder idLaudo(int? idLaudo) {
    _laudo._idLaudo = idLaudo;
    return this;
  }

  LaudoBuilder descricao(String? descricao) {
    _laudo._descricao = descricao;
    return this;
  }

  LaudoBuilder dataEmissao(DateTime? dataEmissao) {
    _laudo._dataEmissao = dataEmissao;
    return this;
  }

  LaudoBuilder idMedico(int? idMedico) {
    _laudo._idMedico = idMedico;
    return this;
  }

  Laudo build() {
    // Validações obrigatórias
    if (_laudo._descricao == null || _laudo._descricao!.isEmpty) {
      throw ArgumentError('Descrição do laudo é obrigatória');
    }
    if (_laudo._idMedico == null || _laudo._idMedico! <= 0) {
      throw ArgumentError('ID do médico é obrigatório e deve ser maior que zero');
    }
    if (_laudo._dataEmissao == null) {
      _laudo._dataEmissao = DateTime.now();
    }
    
    return _laudo;
  }
}
