class ProntuarioService {
  // 🔹 8) Paciente Internado
  // Fluxo: opt paciente.internado == true → se o paciente estiver internado, inicia-se um loop diário:
  // Atualiza automaticamente o prontuário (atualizarProntuarioDiario).
  // Dentro do loop, há outra condição:
  // opt condição_crítica → se for detectada uma situação crítica, envia-se uma notificação de alerta ao médico.
  static void atualizarProntuarioDiario(int pacienteId, int medicoId) {
    print('🏥 Atualizando prontuário diário para paciente ID: $pacienteId');
    print('Buscando prontuário no banco de dados...');
    print('Prontuário encontrado!');
    
    // Simular atualização diária do prontuário
    print('Adicionando entrada diária ao prontuário...');
    print('Pressão arterial: 120/80');
    print('Temperatura: 36.5°C');
    print('Frequência cardíaca: 72 bpm');

    // opt condição_crítica → verificar se há situação crítica
    print('Verificando condições críticas...');
    print('Sinais vitais normais - nenhuma condição crítica detectada');
    
    print('✅ Prontuário atualizado com sucesso!');
  }

  // Método para simular loop diário de pacientes internados
  static void processarPacientesInternados() {
    print('🔄 Iniciando processamento diário de pacientes internados...');
    
    print('Processando paciente internado ID: 1');
    atualizarProntuarioDiario(1, 1);
    print('');
    
    print('Processando paciente internado ID: 2');
    atualizarProntuarioDiario(2, 2);
    print('');
    
    print('Processando paciente internado ID: 3');
    atualizarProntuarioDiario(3, 1);
    print('');

    print('✅ Processamento diário de pacientes internados concluído');
  }
}

