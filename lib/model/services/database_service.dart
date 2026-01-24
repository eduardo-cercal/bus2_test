import 'package:bus2_test/utils/mapper.dart';
import 'package:hive/hive.dart';

class DatabaseService {
  final Box box;

  DatabaseService(this.box);

  Future<String> getUserList() async => await box.get(Mapper.users) ?? '';

  Future<void> saveList(String userList) async =>
      await box.put(Mapper.users, userList);
}
