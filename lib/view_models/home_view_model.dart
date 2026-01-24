import 'package:bus2_test/model/repositories/api_repository.dart';
import 'package:bus2_test/model/repositories/database_repository.dart';
import 'package:bus2_test/utils/failures.dart';
import 'package:bus2_test/view_models/entities/user_entity.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final ApiRepository _apiRepository;
  final DatabaseRepository _databaseRepository;

  HomeViewModel({
    required ApiRepository apiRepository,
    required DatabaseRepository databaseRepository,
  }) : _apiRepository = apiRepository,
       _databaseRepository = databaseRepository;

  final failure = RxnString();
  final isLoading = false.obs;

  Future<UserEntity> getUser() async {
    try {
      isLoading.value = true;
      return await _apiRepository.getFirstUser();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveUser({
    required UserEntity user,
    required List<UserEntity> list,
  }) async => _databaseRepository.saveUser(user: user, list: list);

  Future<List<UserEntity>> getUserList() async {
    try {
      return await _databaseRepository.getUserList();
    } on EmptyListFailure {
      return [];
    }
  }
}
