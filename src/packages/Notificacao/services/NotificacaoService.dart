class NotificacaoService {
  // 🔹 7) Consulta de Notificações
  // Fluxo: O médico pode consultar suas notificações a qualquer momento:
  // verNotificacoesPorMedico → o sistema consulta a entidade Notificação e retorna a lista para o médico.
  // Aqui não há opt/alt, porque é uma chamada direta e obrigatória.
  
  // Ver notificações por médico
  static void verNotificacoesPorMedico(int medicoId) {
    print('📧 Consultando notificações para médico ID: $medicoId');
    print('Buscando notificações no banco de dados...');
    print('Total de notificações: 4');
    print('Notificações não lidas: 2');
    print('🔴 Nova Consulta Agendada - 15/12/2024');
    print('   Nova consulta agendada com João Silva para 16/12/2024 às 14:30');
    print('🔴 Novo Exame Solicitado - 15/12/2024');
    print('   Novo exame Raio-X do Tórax solicitado para paciente ID: 123');
    print('✅ Resultado de Exame - 14/12/2024');
    print('   Resultado negativo no exame Exame de Sangue');
    print('✅ Nova Consulta Agendada - 13/12/2024');
    print('   Nova consulta agendada com Maria Santos para 17/12/2024 às 09:00');
  }
}
