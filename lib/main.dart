import 'dart:io';

import 'package:bus2_test/factories/views/home_view_factory.dart';
import 'package:bus2_test/factories/views/saved_user_list_view_factory.dart';
import 'package:bus2_test/factories/views/user_details_view_factory.dart';
import 'package:bus2_test/utils/route_name.dart';

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
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.home,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red[700],
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: .bold,
            fontSize: 16,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      getPages: [
        GetPage(name: RouteName.home, page: homeViewFactory),
        GetPage(name: RouteName.savedUserList, page: savedUserListViewFactory),
        GetPage(name: RouteName.userDetails, page: userDetailsViewFactory),
      ],
    );
  }
}
