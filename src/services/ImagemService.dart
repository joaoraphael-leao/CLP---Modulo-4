class ImagemService {
  // 🔹 6) Visualizar Imagens
  // Fluxo: O médico pode:
  // Ver os detalhes de um exame → chama verImagensPorExame.
  // Ver os detalhes de um paciente → chama verImagensPorPaciente.
  // Em ambos os casos, o sistema retorna as imagens correspondentes.
  
  // Ver imagens por exame
  static void verImagensPorExame(int exameId) {
    print('🖼️ Visualizando imagens para exame ID: $exameId');
    print('Buscando imagens no banco de dados...');
    print('Total de imagens encontradas: 2');
    print('- Imagem ID: 201');
    print('  URL: https://exemplo.com/imagem_101_1.jpg');
    print('  Descrição: Raio-X frontal do tórax');
    print('- Imagem ID: 202');
    print('  URL: https://exemplo.com/imagem_101_2.jpg');
    print('  Descrição: Raio-X lateral do tórax');
  }

  // Ver imagens por paciente
  static void verImagensPorPaciente(int pacienteId) {
    print('🖼️ Visualizando imagens para paciente ID: $pacienteId');
    print('Buscando exames do paciente...');
    print('Total de exames: 3');
    print('Exame Raio-X do Tórax (ID: 101):');
    print('  - Imagem ID: 201');
    print('    URL: https://exemplo.com/imagem_101_1.jpg');
    print('    Descrição: Raio-X frontal do tórax');
    print('  - Imagem ID: 202');
    print('    URL: https://exemplo.com/imagem_101_2.jpg');
    print('    Descrição: Raio-X lateral do tórax');
    print('Exame Ultrassom (ID: 102):');
    print('  - Imagem ID: 203');
    print('    URL: https://exemplo.com/imagem_102_1.jpg');
    print('    Descrição: Ultrassom abdominal');
    print('Total de imagens encontradas: 3');
  }
}

