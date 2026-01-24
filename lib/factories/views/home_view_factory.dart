import 'package:bus2_test/factories/view_models/home_view_model_factory.dart';
import 'package:bus2_test/views/home_view.dart';
import 'package:flutter/material.dart';

Widget homeViewFactory() => HomeView(viewModel: homeViewModelFactory());
