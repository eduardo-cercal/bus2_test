import 'package:bus2_test/model/services/database_service.dart';
import 'package:bus2_test/utils/mapper.dart';
import 'package:hive/hive.dart';

DatabaseService databaseServiceFactory() =>
    DatabaseService(Hive.box(Mapper.databaseName));
