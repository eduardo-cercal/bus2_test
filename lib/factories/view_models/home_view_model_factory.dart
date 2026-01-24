import 'package:bus2_test/factories/repositories/api_repository_factory.dart';
import 'package:bus2_test/factories/repositories/database_repository_factory.dart';
import 'package:bus2_test/view_models/home_view_model.dart';

HomeViewModel homeViewModelFactory() => HomeViewModel(
  apiRepository: apiRepositoryFactory(),
  databaseRepository: databaseRepositoryFactory(),
);
