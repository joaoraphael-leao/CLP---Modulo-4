class AgendaService {
  // 🔹 1) Visualizar Agenda
  // Fluxo: O paciente pede para ver a agenda (visualizarAgenda).
  // O Sistema consulta a Agenda, obtém os horários e retorna para o paciente.
  // Função: Permite ao paciente escolher um horário disponível antes de tentar criar um agendamento.
  static void visualizarAgenda(int medicoId, DateTime data) {
    print('📅 Visualizando agenda do médico ID: $medicoId para ${data.day}/${data.month}/${data.year}');
    print('Consultando banco de dados...');
    print('Horários ocupados: [09:00, 10:30, 14:00]');
    print('Horários disponíveis: [08:00, 08:30, 09:30, 10:00, 11:00, 11:30, 13:00, 13:30, 14:30, 15:00, 15:30, 16:00, 16:30, 17:00, 17:30]');
  }

  // Verificar se um horário está disponível
  static bool verificarDisponibilidade(int medicoId, DateTime dataHora) {
    print('Verificando disponibilidade do horário ${dataHora.hour}:${dataHora.minute.toString().padLeft(2, '0')}...');
    // Simulação simples - sempre disponível
    return true;
  }

  // Marcar horário como ocupado
  static void marcarHorario(int medicoId, DateTime dataHora) {
    print('⏰ Horário marcado: ${dataHora.hour}:${dataHora.minute.toString().padLeft(2, '0')} para médico ID: $medicoId');
  }
}
