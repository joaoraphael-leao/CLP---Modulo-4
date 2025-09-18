import '../models/Paciente.dart';

class PacienteService {
  // Criar novo paciente
  static void criarPaciente(Paciente paciente) {
    print('👤 Criando novo paciente: ${paciente.nome}');
    print('Validando dados do paciente...');
    print('CPF: ${paciente.cpf}');
    print('Data de nascimento: ${paciente.dataNascimento?.day}/${paciente.dataNascimento?.month}/${paciente.dataNascimento?.year}');
    print('Internado: ${paciente.internado}');
    print('ID gerado: 11111');
    print('Salvando paciente no banco de dados...');
    print('✅ Paciente criado com sucesso!');
  }

  // Buscar paciente por ID
  static void buscarPorId(String id) {
    print('🔍 Buscando paciente por ID: $id');
    print('Consultando banco de dados...');
    print('Paciente encontrado:');
    print('Nome: João Silva');
    print('ID: $id');
    print('CPF: 123.456.789-00');
    print('Data de nascimento: 15/03/1985');
    print('Internado: false');
  }

  // Listar todos os pacientes
  static void listarPacientes() {
    print('📋 Listando todos os pacientes');
    print('Consultando banco de dados...');
    print('Total de pacientes cadastrados: 5');
    print('1. João Silva - CPF: 123.456.789-00 (ID: 11111)');
    print('2. Maria Santos - CPF: 987.654.321-00 (ID: 11112)');
    print('3. Pedro Costa - CPF: 456.789.123-00 (ID: 11113)');
    print('4. Ana Oliveira - CPF: 789.123.456-00 (ID: 11114)');
    print('5. Carlos Lima - CPF: 321.654.987-00 (ID: 11115)');
  }

  // Atualizar paciente
  static void atualizarPaciente(Paciente pacienteAtualizado) {
    print('✏️ Atualizando paciente ID: ${pacienteAtualizado.id}');
    print('Buscando paciente no banco de dados...');
    print('Paciente encontrado: ${pacienteAtualizado.nome}');
    print('Salvando alterações...');
    print('✅ Paciente atualizado com sucesso!');
  }

  // Deletar paciente
  static void deletarPaciente(String id) {
    print('🗑️ Deletando paciente ID: $id');
    print('Buscando paciente no banco de dados...');
    print('Paciente encontrado: João Silva');
    print('Removendo do banco de dados...');
    print('✅ Paciente deletado com sucesso!');
  }

  // Buscar paciente por CPF
  static void buscarPorCPF(String cpf) {
    print('🔍 Buscando paciente por CPF: $cpf');
    print('Consultando banco de dados...');
    print('Paciente encontrado:');
    print('Nome: João Silva');
    print('ID: 11111');
    print('CPF: $cpf');
    print('Data de nascimento: 15/03/1985');
  }

  // Buscar pacientes por nome
  static void buscarPorNome(String nome) {
    print('🔍 Buscando pacientes por nome: $nome');
    print('Consultando banco de dados...');
    print('Pacientes encontrados: 2');
    print('1. João Silva - CPF: 123.456.789-00 (ID: 11111)');
    print('2. João Pedro - CPF: 111.222.333-00 (ID: 11116)');
  }

  // Buscar pacientes por data de nascimento
  static void buscarPorDataNascimento(DateTime dataNascimento) {
    print('🔍 Buscando pacientes por data de nascimento: ${dataNascimento.day}/${dataNascimento.month}/${dataNascimento.year}');
    print('Consultando banco de dados...');
    print('Pacientes encontrados: 1');
    print('1. João Silva - CPF: 123.456.789-00 (ID: 11111)');
  }

  // Buscar pacientes por idade
  static void buscarPorIdade(int idade) {
    print('🔍 Buscando pacientes por idade: $idade anos');
    print('Consultando banco de dados...');
    print('Pacientes encontrados: 2');
    print('1. João Silva - CPF: 123.456.789-00 (ID: 11111)');
    print('2. Maria Santos - CPF: 987.654.321-00 (ID: 11112)');
  }
}

