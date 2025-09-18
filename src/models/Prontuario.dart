class Prontuario {
  int? _idProntuario;
  DateTime? _dataCriacao;      // Obrigatório - sempre tem data de criação
  String? _observacoesGerais; // Opcional - pode não ter observações
  int? _idPaciente;           // Obrigatório - prontuário deve ter paciente
  int? _idMedico;            // Opcional - pode não ter médico responsável
  String? _historicoDoencas; // Opcional - pode não ter histórico
  String? _alergias;         // Opcional - pode não ter alergias
  String? _medicacoesAtuais; // Opcional - pode não ter medicações
  String? _pressaoArterial;  // Opcional - pode não ter pressão registrada

  // Construtor privado
  Prontuario._();

  // Builder class
  static ProntuarioBuilder builder() {
    return ProntuarioBuilder();
  }

  // Getters
  int? get idProntuario => _idProntuario;
  DateTime? get dataCriacao => _dataCriacao;
  String? get observacoesGerais => _observacoesGerais;
  int? get idPaciente => _idPaciente;
  int? get idMedico => _idMedico;
  String? get historicoDoencas => _historicoDoencas;
  String? get alergias => _alergias;
  String? get medicacoesAtuais => _medicacoesAtuais;
  String? get pressaoArterial => _pressaoArterial;

  // Setters
  set idProntuario(int? value) => _idProntuario = value;
  set dataCriacao(DateTime? value) => _dataCriacao = value;
  set observacoesGerais(String? value) => _observacoesGerais = value;
  set idPaciente(int? value) => _idPaciente = value;
  set idMedico(int? value) => _idMedico = value;
  set historicoDoencas(String? value) => _historicoDoencas = value;
  set alergias(String? value) => _alergias = value;
  set medicacoesAtuais(String? value) => _medicacoesAtuais = value;
  set pressaoArterial(String? value) => _pressaoArterial = value;

  @override
  String toString() {
    return 'Prontuario{idProntuario: $_idProntuario, dataCriacao: $_dataCriacao, observacoesGerais: $_observacoesGerais, idPaciente: $_idPaciente, idMedico: $_idMedico, historicoDoencas: $_historicoDoencas, alergias: $_alergias, medicacoesAtuais: $_medicacoesAtuais, pressaoArterial: $_pressaoArterial}';
  }
}

// Builder class para Prontuario
class ProntuarioBuilder {
  final Prontuario _prontuario = Prontuario._();

  ProntuarioBuilder idProntuario(int? idProntuario) {
    _prontuario._idProntuario = idProntuario;
    return this;
  }

  ProntuarioBuilder dataCriacao(DateTime? dataCriacao) {
    _prontuario._dataCriacao = dataCriacao;
    return this;
  }

  ProntuarioBuilder observacoesGerais(String? observacoesGerais) {
    _prontuario._observacoesGerais = observacoesGerais;
    return this;
  }

  ProntuarioBuilder idPaciente(int? idPaciente) {
    _prontuario._idPaciente = idPaciente;
    return this;
  }

  ProntuarioBuilder idMedico(int? idMedico) {
    _prontuario._idMedico = idMedico;
    return this;
  }

  ProntuarioBuilder historicoDoencas(String? historicoDoencas) {
    _prontuario._historicoDoencas = historicoDoencas;
    return this;
  }

  ProntuarioBuilder alergias(String? alergias) {
    _prontuario._alergias = alergias;
    return this;
  }

  ProntuarioBuilder medicacoesAtuais(String? medicacoesAtuais) {
    _prontuario._medicacoesAtuais = medicacoesAtuais;
    return this;
  }

  ProntuarioBuilder pressaoArterial(String? pressaoArterial) {
    _prontuario._pressaoArterial = pressaoArterial;
    return this;
  }

  Prontuario build() {
    // Validações obrigatórias
    if (_prontuario._idPaciente == null || _prontuario._idPaciente! <= 0) {
      throw ArgumentError('ID do paciente é obrigatório e deve ser maior que zero');
    }
    if (_prontuario._dataCriacao == null) {
      _prontuario._dataCriacao = DateTime.now();
    }
    
    return _prontuario;
  }
}
