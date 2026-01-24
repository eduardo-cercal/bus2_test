import 'dart:io';

import 'package:bus2_test/factories/views/home_view_factory.dart';
import 'package:bus2_test/utils/route_name.dart';
import 'package:bus2_test/views/saved_user_list_view.dart';
import 'package:bus2_test/views/user_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'utils/mapper.dart';

Future<void> main() async {
  Hive.init(Directory.systemTemp.path);
  await Hive.openBox(Mapper.databaseName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteName.home,
      getPages: [
        GetPage(name: RouteName.home, page: homeViewFactory),
        GetPage(name: RouteName.savedUserList, page: () => SavedUserListView()),
        GetPage(name: RouteName.userDetails, page: () => UserDetailsView()),
      ],
    );
  }
}
