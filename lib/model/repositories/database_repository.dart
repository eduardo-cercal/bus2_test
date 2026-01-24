import 'dart:convert';

import 'package:bus2_test/model/services/database_service.dart';
import 'package:bus2_test/utils/failures.dart';
import 'package:bus2_test/view_models/entities/user_entity.dart';

class DatabaseRepository {
  final DatabaseService databaseService;

  DatabaseRepository(this.databaseService);

  Future<List<UserEntity>> getUserList() async {
    final stringResult = await databaseService.getUserList();

    if (stringResult.isEmpty) {
      throw EmptyListFailure();
    }

    final result = jsonDecode(stringResult);

    return result
        .map<UserEntity>((element) => UserEntity.fromJson(element))
        .toList();
  }

  Future<void> saveUser({
    required UserEntity user,
    required List<UserEntity> list,
  }) async {
    list.insert(0, user);

    await databaseService.saveList(
      jsonEncode(list.map((element) => element.toJson()).toList()),
    );
  }

  Future<void> deleteUser({
    required UserEntity user,
    required List<UserEntity> list,
  }) async {
    list.remove(user);
    await databaseService.saveList(
      jsonEncode(list.map((element) => element.toJson()).toList()),
    );
  }
}
