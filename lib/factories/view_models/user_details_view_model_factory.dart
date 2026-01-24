import 'package:bus2_test/factories/repositories/database_repository_factory.dart';

import 'package:bus2_test/view_models/user_details_view_model.dart';

UserDetailsViewModel userDetailsViewModelFactory() =>
    UserDetailsViewModel(databaseRepositoryFactory());
