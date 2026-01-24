import 'package:bus2_test/model/repositories/database_repository.dart';
import 'package:bus2_test/utils/failures.dart';
import 'package:bus2_test/view_models/entities/user_entity.dart';
import 'package:get/get.dart';

class SavedUserListViewModel extends GetxController {
  final DatabaseRepository _databaseRepository;

  SavedUserListViewModel(this._databaseRepository);

  final userList = <UserEntity>[].obs;
  final isLoading = false.obs;
  final failure = RxnString();

  Future<void> getSavedUserList() async {
    try {
      isLoading.value = true;
      failure.value = null;
      userList.addAll(await _databaseRepository.getUserList());
    } on Failures catch (e) {
      failure.value = e.message;
    } finally {
      isLoading.value = false;
    }
  }
}
