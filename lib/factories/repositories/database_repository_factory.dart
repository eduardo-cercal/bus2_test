import 'package:bus2_test/factories/services/database_service_factory.dart';
import 'package:bus2_test/model/repositories/database_repository.dart';

DatabaseRepository databaseRepositoryFactory() =>
    DatabaseRepository(databaseServiceFactory());
