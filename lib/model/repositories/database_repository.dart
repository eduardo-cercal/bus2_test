import 'package:bus2_test/model/services/database_service.dart';
import 'package:bus2_test/utils/failures.dart';
import 'package:bus2_test/view_models/entities/user_entity.dart';

class DatabaseRepository {
  final DatabaseService databaseService;

  DatabaseRepository(this.databaseService);

  Future<List<UserEntity>> getUserList() async {
    final result = await databaseService.getUserList();

    if (result.isEmpty) {
      throw EmptyListFailure();
    }

    return result.map((element) => UserEntity.fromJson(element)).toList();
  }

  Future<void> saveUser({
    required UserEntity user,
    required List<UserEntity> list,
  }) async {
    list.insert(0, user);
    await databaseService.saveList(
      list.map((element) => element.toJson()).toList(),
    );
  }

  Future<void> deleteUser({
    required UserEntity user,
    required List<UserEntity> list,
  }) async {
    list.remove(user);
    await databaseService.saveList(
      list.map((element) => element.toJson()).toList(),
    );
  }
}
