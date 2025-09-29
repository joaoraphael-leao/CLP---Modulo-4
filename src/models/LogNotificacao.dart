class LogNotificacao {
  int? _idNotificacao;
  String _status = 'nao_lida';

  // Construtor privado
  LogNotificacao._();

  // Construtor público
  LogNotificacao(int idNotificacao, {String status = 'nao_lida'}) {
    _idNotificacao = idNotificacao;
    _status = status;
  }

  // Builder class
  static LogNotificacaoBuilder builder() {
    return LogNotificacaoBuilder();
  }

  // Getters
  int? get idNotificacao => _idNotificacao;
  String get status => _status;

  // Setters
  set idNotificacao(int? value) => _idNotificacao = value;
  set status(String value) => _status = value;

  // Método público para alterar status por ID da notificação conforme diagrama UML
  void alteraStatusPorldNotificacao(int idNotificacao, String status) {
    if (_idNotificacao == idNotificacao) {
      _status = status;
    }
  }

  // Método para verificar se a notificação foi lida
  bool isLida() {
    return _status == 'lida';
  }

  // Método para marcar como lida
  void marcarComoLida() {
    _status = 'lida';
  }

  // Método para marcar como não lida
  void marcarComoNaoLida() {
    _status = 'nao_lida';
  }

  // Método para arquivar
  void arquivar() {
    _status = 'arquivada';
  }

  // Método para obter status em português
  String obterStatusEmPortugues() {
    switch (_status) {
      case 'nao_lida':
        return 'Não lida';
      case 'lida':
        return 'Lida';
      case 'arquivada':
        return 'Arquivada';
      case 'excluida':
        return 'Excluída';
      default:
        return 'Desconhecido';
    }
  }

  @override
  String toString() {
    return 'LogNotificacao{idNotificacao: $_idNotificacao, status: $_status}';
  }
}

// Builder class para LogNotificacao
class LogNotificacaoBuilder {
  final LogNotificacao _logNotificacao = LogNotificacao._();

  LogNotificacaoBuilder idNotificacao(int? idNotificacao) {
    _logNotificacao._idNotificacao = idNotificacao;
    return this;
  }

  LogNotificacaoBuilder status(String status) {
    _logNotificacao._status = status;
    return this;
  }

  LogNotificacao build() {
    // Validações obrigatórias
    if (_logNotificacao._idNotificacao == null) {
      throw ArgumentError('ID da notificação é obrigatório');
    }
    if (_logNotificacao._status.isEmpty) {
      throw ArgumentError('Status é obrigatório');
    }
    
    // Validação de status válido
    List<String> statusValidos = ['nao_lida', 'lida', 'arquivada', 'excluida'];
    if (!statusValidos.contains(_logNotificacao._status)) {
      throw ArgumentError('Status inválido. Valores aceitos: ${statusValidos.join(', ')}');
    }
    
    return _logNotificacao;
  }
}



