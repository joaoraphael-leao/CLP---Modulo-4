import 'Notificacao.dart';

class AlertaCritico extends Notificacao {
  String? _acaoRecomendada;
  int? _urgencia;

  // Construtor privado
  AlertaCritico._() : super('', '', 0, 0);

  // Construtor público
  AlertaCritico(String titulo, String conteudo, int idMedico, int idPaciente, 
                String acaoRecomendada, int urgencia) 
      : super(titulo, conteudo, idMedico, idPaciente) {
    _acaoRecomendada = acaoRecomendada;
    _urgencia = urgencia;
  }

  // Builder class
  static AlertaCriticoBuilder builder() {
    return AlertaCriticoBuilder();
  }

  // Getters
  String? get acaoRecomendada => _acaoRecomendada;
  int? get urgencia => _urgencia;

  // Setters
  set acaoRecomendada(String? value) => _acaoRecomendada = value;
  set urgencia(int? value) => _urgencia = value;

  // Métodos específicos do AlertaCrítico conforme diagrama UML
  void emitirSMS() {
    // Implementação para envio de SMS
    print('SMS enviado para alerta crítico: ${super.titulo}');
  }

  void emitirEmail() {
    // Implementação para envio de email
    print('Email enviado para alerta crítico: ${super.titulo}');
  }

  // Método para obter nível de urgência em texto
  String obterNivelUrgencia() {
    if (_urgencia == null) return 'Não definido';
    
    switch (_urgencia) {
      case 1:
        return 'Baixa';
      case 2:
        return 'Média';
      case 3:
        return 'Alta';
      case 4:
        return 'Crítica';
      case 5:
        return 'Emergência';
      default:
        return 'Desconhecido';
    }
  }

  // Método para verificar se é urgente
  bool isUrgente() {
    return _urgencia != null && _urgencia! >= 3;
  }

  @override
  String toString() {
    return 'AlertaCritico{titulo: ${super.titulo}, conteudo: ${super.conteudo}, idPaciente: ${super.idPaciente}, idMedico: ${super.idMedico}, acaoRecomendada: $_acaoRecomendada, urgencia: $_urgencia}';
  }
}

// Builder class para AlertaCritico
class AlertaCriticoBuilder {
  final AlertaCritico _alertaCritico = AlertaCritico._();

  AlertaCriticoBuilder titulo(String? titulo) {
    _alertaCritico.titulo = titulo;
    return this;
  }

  AlertaCriticoBuilder conteudo(String? conteudo) {
    _alertaCritico.conteudo = conteudo;
    return this;
  }

  AlertaCriticoBuilder idPaciente(int? idPaciente) {
    _alertaCritico.idPaciente = idPaciente;
    return this;
  }

  AlertaCriticoBuilder idMedico(int? idMedico) {
    _alertaCritico.idMedico = idMedico;
    return this;
  }

  AlertaCriticoBuilder acaoRecomendada(String? acaoRecomendada) {
    _alertaCritico._acaoRecomendada = acaoRecomendada;
    return this;
  }

  AlertaCriticoBuilder urgencia(int? urgencia) {
    _alertaCritico._urgencia = urgencia;
    return this;
  }

  AlertaCritico build() {
    // Validações obrigatórias
    if (_alertaCritico.titulo == null || _alertaCritico.titulo!.isEmpty) {
      throw ArgumentError('Título é obrigatório');
    }
    if (_alertaCritico.conteudo == null || _alertaCritico.conteudo!.isEmpty) {
      throw ArgumentError('Conteúdo é obrigatório');
    }
    if (_alertaCritico.idMedico == null) {
      throw ArgumentError('ID do médico é obrigatório');
    }
    if (_alertaCritico.idPaciente == null) {
      throw ArgumentError('ID do paciente é obrigatório');
    }
    if (_alertaCritico._acaoRecomendada == null || _alertaCritico._acaoRecomendada!.isEmpty) {
      throw ArgumentError('Ação recomendada é obrigatória');
    }
    if (_alertaCritico._urgencia == null) {
      throw ArgumentError('Nível de urgência é obrigatório');
    }
    if (_alertaCritico._urgencia! < 1 || _alertaCritico._urgencia! > 5) {
      throw ArgumentError('Nível de urgência deve estar entre 1 e 5');
    }
    
    return _alertaCritico;
  }
}
