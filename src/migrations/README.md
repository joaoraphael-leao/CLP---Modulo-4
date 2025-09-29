# 📊 Migrações do Banco de Dados

Este diretório contém as migrações para criar e gerenciar a estrutura do banco de dados.

## 📁 Estrutura

```
src/migrations/
├── 001_create_tables.sql    # Criação de todas as tabelas
├── MigrationRunner.dart     # Executor de migrações
└── README.md               # Este arquivo
```

## 🚀 Como Usar

### 1. **Executar Migrações**

```dart
import 'src/migrations/MigrationRunner.dart';
import 'src/utils/DatabaseConfig.dart';

void main() async {
  final databaseConfig = DatabaseConfig();
  final migrationRunner = MigrationRunner(databaseConfig);
  
  // Executar todas as migrações
  await migrationRunner.runMigrations();
}
```

### 2. **Verificar Tabelas**

```dart
// Verificar se todas as tabelas foram criadas
final tablesExist = await migrationRunner.checkTablesExist();
print('Tabelas criadas: $tablesExist');

// Listar todas as tabelas
final tables = await migrationRunner.listTables();
print('Tabelas: $tables');
```

### 3. **Executar Migração Específica**

```dart
// Executar uma migração específica
await migrationRunner.runMigration('001_create_tables.sql');
```

## 📋 Tabelas Criadas

### **Tabelas Principais:**
- `especialidades` - Especialidades médicas
- `medicos` - Médicos do sistema
- `pacientes` - Pacientes do sistema
- `consultas` - Consultas médicas
- `exames` - Exames médicos
- `imagens` - Imagens dos exames
- `laudos` - Laudos médicos
- `prontuarios` - Prontuários dos pacientes
- `prontuario_entradas` - Entradas do prontuário
- `notificacoes` - Notificações do sistema
- `log_notificacoes` - Log das notificações
- `alertas_criticos` - Alertas críticos
- `agenda_ocupada` - Horários ocupados na agenda

### **Características:**
- ✅ **IDs automáticos** (SERIAL PRIMARY KEY)
- ✅ **Timestamps** automáticos (created_at, updated_at)
- ✅ **Índices** para performance
- ✅ **Triggers** para updated_at
- ✅ **Foreign Keys** para integridade
- ✅ **Dados iniciais** (especialidades básicas)

## 🔧 Estrutura das Tabelas

### **Relacionamentos:**
```
especialidades (1) ←→ (N) medicos
medicos (1) ←→ (N) consultas
pacientes (1) ←→ (N) consultas
medicos (1) ←→ (N) exames
pacientes (1) ←→ (N) exames
exames (1) ←→ (N) imagens
exames (1) ←→ (N) laudos
medicos (1) ←→ (N) laudos
pacientes (1) ←→ (N) prontuarios
medicos (1) ←→ (N) prontuarios
```

### **Índices Criados:**
- Índices em foreign keys
- Índices em campos de busca frequente
- Índices compostos para consultas complexas

## ⚠️ Importante

1. **Execute as migrações apenas uma vez**
2. **Faça backup antes de executar em produção**
3. **Verifique se o banco está acessível**
4. **Os IDs agora são responsabilidade do PostgreSQL**

## 🎯 Próximos Passos

1. **Executar as migrações** no banco de dados
2. **Testar as queries** nos repositories
3. **Configurar dados iniciais** se necessário
4. **Implementar testes** de integração
