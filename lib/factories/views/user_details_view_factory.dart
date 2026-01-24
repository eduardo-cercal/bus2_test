import 'package:bus2_test/factories/view_models/user_details_view_model_factory.dart';
import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/views/user_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget userDetailsViewFactory() {
  final arguments = Get.arguments;
  return UserDetailsView(
    user: arguments[Mapper.user],
    viewModel: userDetailsViewModelFactory(),
  );
}
