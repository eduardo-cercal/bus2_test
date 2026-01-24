import 'package:bus2_test/factories/view_models/saved_user_list_view_model_factory.dart';
import 'package:bus2_test/views/saved_user_list_view.dart';
import 'package:flutter/widgets.dart';

Widget savedUserListViewFactory() =>
    SavedUserListView(viewModel: savedUserListViewModelFactory());
