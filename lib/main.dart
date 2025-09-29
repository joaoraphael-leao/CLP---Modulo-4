import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'src/utils/DatabaseConfig.dart';
import 'src/services/BaseService.dart';
import 'src/services/ConsultaService.dart';

// Configuração do GetIt
final getIt = GetIt.instance;

void main() async {
  // Configurar injeção de dependência
  await configureDependencies();
  
  // Exemplo de uso
  final consultaService = getIt<ConsultaService>();
  
  // Agora você pode usar o databaseConfig em qualquer service
  await consultaService.ensureConnection();
}

@InjectableInit()
Future<void> configureDependencies() async {
  // Registrar DatabaseConfig como singleton
  getIt.registerSingleton<DatabaseConfig>(DatabaseConfig());
  
  // Registrar todos os services
  getIt.registerFactory<ConsultaService>(() => ConsultaService());
  
  // Se tiver outros services, registre aqui
  // getIt.registerFactory<PacienteService>(() => PacienteService());
  // getIt.registerFactory<MedicoService>(() => MedicoService());
}
