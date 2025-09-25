import '../models/Medico.dart';

class MedicoService {
  // Criar novo médico
  static void criarMedico(Medico medico) {
    print('👨‍⚕️ Criando novo médico: ${medico.nome}');
    print('Validando dados do médico...');
    print('CRM: ${medico.crm}');
    print('Especialidade ID: ${medico.especialidadeId}');
    print('ID gerado: 45678');
    print('Salvando médico no banco de dados...');
    print('✅ Médico criado com sucesso!');
  }

  // Buscar médico por ID
  static void buscarPorId(String id) {
    print('🔍 Buscando médico por ID: $id');
    print('Consultando banco de dados...');
    print('Médico encontrado:');
    print('Nome: Dr. João Silva');
    print('ID: $id');
    print('CRM: 12345');
    print('Especialidade ID: 12345');
    print('Ativo: true');
  }

  // Listar todos os médicos
  static void listarMedicos() {
    print('📋 Listando todos os médicos');
    print('Consultando banco de dados...');
    print('Total de médicos cadastrados: 4');
    print('1. Dr. João Silva - CRM: 12345 (ID: 45678)');
    print('2. Dra. Maria Santos - CRM: 12346 (ID: 45679)');
    print('3. Dr. Pedro Costa - CRM: 12347 (ID: 45680)');
    print('4. Dra. Ana Oliveira - CRM: 12348 (ID: 45681)');
  }

  // Atualizar médico
  static void atualizarMedico(Medico medicoAtualizado) {
    print('✏️ Atualizando médico ID: ${medicoAtualizado.id}');
    print('Buscando médico no banco de dados...');
    print('Médico encontrado: ${medicoAtualizado.nome}');
    print('Salvando alterações...');
    print('✅ Médico atualizado com sucesso!');
  }

  // Deletar médico
  static void deletarMedico(String id) {
    print('🗑️ Deletando médico ID: $id');
    print('Buscando médico no banco de dados...');
    print('Médico encontrado: Dr. João Silva');
    print('Removendo do banco de dados...');
    print('✅ Médico deletado com sucesso!');
  }

  // Buscar médico por CRM
  static void buscarPorCRM(String crm) {
    print('🔍 Buscando médico por CRM: $crm');
    print('Consultando banco de dados...');
    print('Médico encontrado:');
    print('Nome: Dr. João Silva');
    print('ID: 45678');
    print('CRM: $crm');
    print('Especialidade ID: 12345');
  }

  // Buscar médicos por especialidade
  static void buscarPorEspecialidade(String especialidadeId) {
    print('🔍 Buscando médicos por especialidade ID: $especialidadeId');
    print('Consultando banco de dados...');
    print('Médicos encontrados: 2');
    print('1. Dr. João Silva - CRM: 12345 (ID: 45678)');
    print('2. Dra. Maria Santos - CRM: 12346 (ID: 45679)');
  }

  // Buscar médicos por nome
  static void buscarPorNome(String nome) {
    print('🔍 Buscando médicos por nome: $nome');
    print('Consultando banco de dados...');
    print('Médicos encontrados: 1');
    print('1. Dr. João Silva - CRM: 12345 (ID: 45678)');
  }

  // Buscar médicos ativos
  static void buscarAtivos() {
    print('🔍 Buscando médicos ativos');
    print('Consultando banco de dados...');
    print('Médicos ativos encontrados: 3');
    print('1. Dr. João Silva - CRM: 12345 (ID: 45678)');
    print('2. Dra. Maria Santos - CRM: 12346 (ID: 45679)');
    print('3. Dr. Pedro Costa - CRM: 12347 (ID: 45680)');
  }
}

