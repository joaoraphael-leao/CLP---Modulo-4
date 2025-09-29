# 📁 Repositories - Camada de Acesso a Dados

Este diretório contém os **repositories** responsáveis por executar queries no banco de dados.

## 🏗️ Estrutura

```
src/repositories/
├── BaseRepository.dart      # Classe base com métodos genéricos
├── ConsultaRepository.dart # Queries relacionadas a consultas
├── ExameRepository.dart    # Queries relacionadas a exames
├── PacienteRepository.dart # Queries relacionadas a pacientes
├── MedicoRepository.dart   # Queries relacionadas a médicos
└── ...
```

## 🎯 Padrão de Uso

### 1. **BaseRepository**
- Fornece métodos genéricos para executar queries
- Gerencia conexões com o banco de dados
- Suporte a transações

### 2. **Repositories Específicos**
- Herdam de `BaseRepository`
- Contêm queries específicas de cada entidade
- Métodos focados em operações CRUD

### 3. **Integração com Services**
```dart
@injectable
class ConsultaService extends BaseService {
  final ConsultaRepository _consultaRepository;
  
  ConsultaService(super.databaseConfig, this._consultaRepository);
  
  Future<void> criarAgendamento(...) async {
    // Lógica de negócio
    final consultaId = await _consultaRepository.criarConsulta(...);
    // Mais lógica...
  }
}
```

## 📋 Métodos Disponíveis no BaseRepository

- `executeQuery()` - Para SELECT
- `executeCommand()` - Para INSERT/UPDATE/DELETE  
- `executeTransaction()` - Para transações

## 🔧 Exemplo de Query

```dart
Future<List<Map<String, dynamic>>> buscarConsultasPorMedico(int medicoId) async {
  const query = '''
    SELECT c.*, p.nome as paciente_nome
    FROM consultas c
    JOIN pacientes p ON c.paciente_id = p.id
    WHERE c.medico_id = @medicoId
    ORDER BY c.data_consulta DESC
  ''';
  
  return await executeQuery(query, {'medicoId': medicoId});
}
```
