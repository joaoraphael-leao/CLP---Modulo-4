class ExameService {
  // 🔹 3) Geração de Exame
  // Fluxo: Quando o sistema cria um exame (criarExame), o médico é sempre notificado (notificarMedico).
  // opt precisaDeImagem == true → se o exame exige imagem, o sistema requisita a criação da imagem e associa ao exame.
  static void criarExameCompleto({
    required int medicoId,
    required int pacienteId,
    required String tipoExame,
    required DateTime dataExame,
    required bool precisaDeImagem,
    String? descricaoImagem
  }) {
    print('🔬 Criando exame: $tipoExame para paciente ID: $pacienteId');
    print('Salvando exame no banco de dados...');
    print('Exame criado com ID: 101');
    
    // Sempre notificar o médico
    print('📧 Notificação enviada para médico ID: $medicoId sobre novo exame: $tipoExame');

    // opt precisaDeImagem == true
    print('Exame requer imagem, criando imagem associada...');
    print('Imagem criada com ID: 201 para exame ID: 101');
    print('URL da imagem: https://exemplo.com/imagem_101.jpg');
    
    print('✅ Exame criado com sucesso!');
  }

  // 🔹 4) Atualização de Resultado do Exame
  // Fluxo: O médico atualiza o resultado do exame (atualizarResultado).
  // O sistema salva o resultado e avalia:
  // alt resultado == "positivo" / "negativo" → dependendo do caso, envia uma notificação específica ao médico.
  static void atualizarResultado(int exameId, String resultado) {
    print('📊 Atualizando resultado do exame ID: $exameId para: $resultado');
    print('Buscando exame no banco de dados...');
    print('Exame encontrado!');
    print('Salvando resultado...');

    // alt resultado == "positivo" / "negativo"
    print('🚨 ALERTA: Resultado POSITIVO detectado para exame ID: $exameId');
    print('📧 Notificação URGENTE enviada para médico ID: 456 - Resultado positivo requer atenção imediata');
    
    print('✅ Resultado atualizado com sucesso!');
  }
}

