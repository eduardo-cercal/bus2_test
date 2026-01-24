import 'package:bus2_test/factories/services/api_service_factory.dart';
import 'package:bus2_test/model/repositories/api_repository.dart';

ApiRepository apiRepositoryFactory() => ApiRepository(apiServiceFactory());
