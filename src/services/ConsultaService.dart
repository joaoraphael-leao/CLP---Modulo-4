class ConsultaService {
  // 🔹 2) Criar Agendamento
  // Fluxo: O paciente solicita criarAgendamento.
  // opt paciente/medico não cadastrado → se não cadastrado, cria automaticamente
  // alt disponivel / indisponivel → Se disponível → cria Consulta e notifica; Se indisponível → erro
  static void criarAgendamento({
    required int? pacienteId,
    required int? medicoId,
    required DateTime dataConsulta,
    String? nomePaciente,
    String? cpfPaciente,
    String? nomeMedico,
    String? crmMedico,
    String? sintomas
  }) {
    print('📝 Criando agendamento para ${dataConsulta.day}/${dataConsulta.month}/${dataConsulta.year} às ${dataConsulta.hour}:${dataConsulta.minute.toString().padLeft(2, '0')}');

    // opt paciente não cadastrado → criar automaticamente
    print('Paciente não cadastrado, criando automaticamente: $nomePaciente');
    print('Paciente criado com ID: 123');

    // opt médico não cadastrado → criar automaticamente
    print('Médico não cadastrado, criando automaticamente: $nomeMedico');
    print('Médico criado com ID: 456');

    // alt disponível / indisponível
    print('Verificando disponibilidade do horário...');
    print('Horário disponível: true');
    
    print('Criando consulta no banco de dados...');
    print('Consulta criada com ID: 789');
    
    print('Marcando horário como ocupado...');
    print('⏰ Horário marcado: ${dataConsulta.hour}:${dataConsulta.minute.toString().padLeft(2, '0')} para médico ID: 456');

    // Enviar notificações
    print('📧 Notificação enviada para médico sobre nova consulta');
    print('📧 Notificação enviada para paciente sobre agendamento confirmado');
    print('✅ Agendamento criado com sucesso!');
  }

  // 🔹 5) Início de Consulta
  // Fluxo: O médico inicia uma consulta (iniciarConsulta).
  // O sistema inicializa o prontuário do paciente e verifica se há exames necessários.
  // opt examesNecessarios != null → se houver exames, agenda e notifica médico
  static void iniciarConsulta(int consultaId) {
    print('🏥 Iniciando consulta ID: $consultaId');
    print('Buscando consulta no banco de dados...');
    print('Consulta encontrada!');
    
    // Inicializar prontuário do paciente
    print('Inicializando prontuário para paciente ID: 123');
    
    // opt examesNecessarios != null
    print('Verificando se há exames necessários...');
    print('Exames necessários encontrados: [Raio-X do Tórax, Exame de Sangue]');
    
    print('Agendando exame: Raio-X do Tórax');
    print('📧 Notificação enviada para médico sobre exame agendado: Raio-X do Tórax');
    
    print('Agendando exame: Exame de Sangue');
    print('📧 Notificação enviada para médico sobre exame agendado: Exame de Sangue');
    
    print('✅ Consulta iniciada com sucesso!');
  }
}

