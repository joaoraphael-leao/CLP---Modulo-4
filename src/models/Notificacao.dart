class Notificacao {
  String? _titulo;
  String? _conteudo;
  int? _idPaciente;
  int? _idMedico;

  // Construtor privado
  Notificacao._();

  // Construtor público conforme diagrama UML
  Notificacao(String titulo, String conteudo, int idMedico, int idPaciente) {
    _titulo = titulo;
    _conteudo = conteudo;
    _idMedico = idMedico;
    _idPaciente = idPaciente;
  }

  // Builder class
  static NotificacaoBuilder builder() {
    return NotificacaoBuilder();
  }

  // Getters
  String? get titulo => _titulo;
  String? get conteudo => _conteudo;
  int? get idPaciente => _idPaciente;
  int? get idMedico => _idMedico;

  // Setters
  set titulo(String? value) => _titulo = value;
  set conteudo(String? value) => _conteudo = value;
  set idPaciente(int? value) => _idPaciente = value;
  set idMedico(int? value) => _idMedico = value;

  // Método privado para emitir notificação conforme diagrama UML
  void _emitirNotificacao(String titulo, String conteudo, int idMedico, int idPaciente) {
    this._titulo = titulo;
    this._conteudo = conteudo;
    this._idMedico = idMedico;
    this._idPaciente = idPaciente;
  }

  // Método público que utiliza o método privado
  void emitirNotificacao(String titulo, String conteudo, int idMedico, int idPaciente) {
    _emitirNotificacao(titulo, conteudo, idMedico, idPaciente);
  }

  // Método público para alterar status da notificação
  void alterarStatusNotificacao() {
    // Implementação para alterar status da notificação
    // Por exemplo, marcar como lida, arquivada, etc.
  }

  @override
  String toString() {
    return 'Notificacao{titulo: $_titulo, conteudo: $_conteudo, idPaciente: $_idPaciente, idMedico: $_idMedico}';
  }
}

// Builder class para Notificacao
class NotificacaoBuilder {
  final Notificacao _notificacao = Notificacao._();

  NotificacaoBuilder titulo(String? titulo) {
    _notificacao._titulo = titulo;
    return this;
  }

  NotificacaoBuilder conteudo(String? conteudo) {
    _notificacao._conteudo = conteudo;
    return this;
  }

  NotificacaoBuilder idPaciente(int? idPaciente) {
    _notificacao._idPaciente = idPaciente;
    return this;
  }

  NotificacaoBuilder idMedico(int? idMedico) {
    _notificacao._idMedico = idMedico;
    return this;
  }

  Notificacao build() {
    // Validações obrigatórias
    if (_notificacao._titulo == null || _notificacao._titulo!.isEmpty) {
      throw ArgumentError('Título é obrigatório');
    }
    if (_notificacao._conteudo == null || _notificacao._conteudo!.isEmpty) {
      throw ArgumentError('Conteúdo é obrigatório');
    }
    if (_notificacao._idMedico == null) {
      throw ArgumentError('ID do médico é obrigatório');
    }
    if (_notificacao._idPaciente == null) {
      throw ArgumentError('ID do paciente é obrigatório');
    }
    
    return _notificacao;
  }
}
