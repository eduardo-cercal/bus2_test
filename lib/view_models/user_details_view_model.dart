import 'package:bus2_test/model/repositories/database_repository.dart';
import 'package:bus2_test/view_models/entities/user_entity.dart';
import 'package:get/get.dart';

class UserDetailsViewModel extends GetxController {
  final DatabaseRepository _databaseRepository;

  UserDetailsViewModel(this._databaseRepository);

  final isLoading = false.obs;
  final isInList = true.obs;

  Future<void> executeCommand(UserEntity user) async {
    try {
      isLoading.value = true;
      final list = await _databaseRepository.getUserList();
      isInList.value
          ? await _databaseRepository.deleteUser(user: user, list: list)
          : await _databaseRepository.saveUser(user: user, list: list);
      validateInList(user);
    } catch (e) {
      return;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> validateInList(UserEntity user) async {
    try {
      isLoading.value = true;
      final list = await _databaseRepository.getUserList();
      isInList.value = list.contains(user);
    } catch (e) {
      return;
    } finally {
      isLoading.value = false;
    }
  }
}
