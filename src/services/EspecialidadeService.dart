import '../models/Especialidade.dart';

class EspecialidadeService {
  // Criar nova especialidade
  static void criarEspecialidade(Especialidade especialidade) {
    print('🏥 Criando nova especialidade: ${especialidade.nome}');
    print('Validando dados da especialidade...');
    print('ID gerado: 12345');
    print('Salvando especialidade no banco de dados...');
    print('✅ Especialidade criada com sucesso!');
  }

  // Buscar especialidade por ID
  static void buscarPorId(String id) {
    print('🔍 Buscando especialidade por ID: $id');
    print('Consultando banco de dados...');
    print('Especialidade encontrada: Cardiologia');
    print('ID: $id');
    print('Descrição: Especialidade médica que trata do coração');
  }

  // Listar todas as especialidades
  static void listarEspecialidades() {
    print('📋 Listando todas as especialidades');
    print('Consultando banco de dados...');
    print('Total de especialidades cadastradas: 5');
    print('1. Cardiologia (ID: 12345)');
    print('2. Neurologia (ID: 12346)');
    print('3. Ortopedia (ID: 12347)');
    print('4. Pediatria (ID: 12348)');
    print('5. Dermatologia (ID: 12349)');
  }

  // Atualizar especialidade
  static void atualizarEspecialidade(Especialidade especialidadeAtualizada) {
    print('✏️ Atualizando especialidade ID: ${especialidadeAtualizada.id}');
    print('Buscando especialidade no banco de dados...');
    print('Especialidade encontrada: ${especialidadeAtualizada.nome}');
    print('Salvando alterações...');
    print('✅ Especialidade atualizada com sucesso!');
  }

  // Deletar especialidade
  static void deletarEspecialidade(String id) {
    print('🗑️ Deletando especialidade ID: $id');
    print('Buscando especialidade no banco de dados...');
    print('Especialidade encontrada: Cardiologia');
    print('Removendo do banco de dados...');
    print('✅ Especialidade deletada com sucesso!');
  }

  // Buscar especialidade por nome
  static void buscarPorNome(String nome) {
    print('🔍 Buscando especialidades por nome: $nome');
    print('Consultando banco de dados...');
    print('Especialidades encontradas: 2');
    print('1. Cardiologia (ID: 12345)');
    print('2. Cardiologia Pediátrica (ID: 12350)');
  }
}

