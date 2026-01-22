import 'package:bus2_test/utils/mapper.dart';
import 'package:hive/hive.dart';

class DatabaseService {
  final Box box;

  DatabaseService(this.box);

  Future<List<Map<String, dynamic>>> getUserList() async =>
      await box.get(Mapper.users);

  Future<void> saveList(List<Map<String, dynamic>> userList) async =>
      await box.put(Mapper.users, userList);
}
