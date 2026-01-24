import 'package:bus2_test/factories/repositories/database_repository_factory.dart';
import 'package:bus2_test/view_models/saved_user_list_view_model.dart';

SavedUserListViewModel savedUserListViewModelFactory() =>
    SavedUserListViewModel(databaseRepositoryFactory());
