import 'package:bus2_test/view_models/entities/user_entity.dart';
import 'package:bus2_test/view_models/user_details_view_model.dart';
import 'package:bus2_test/views/widgets/user_dob_info_widget.dart';
import 'package:bus2_test/views/widgets/user_header_widget.dart';
import 'package:bus2_test/views/widgets/user_id_info_widget.dart';
import 'package:bus2_test/views/widgets/user_localization_info_widget.dart';
import 'package:bus2_test/views/widgets/user_login_info_widget.dart';
import 'package:bus2_test/views/widgets/user_personal_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({
    super.key,
    required this.user,
    required this.viewModel,
  });

  final UserEntity user;
  final UserDetailsViewModel viewModel;

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.validateInList(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(.infinity, 60),
        child: Obx(
          () => AppBar(
            title: Text('Detalhes do usuário'),
            actions: widget.viewModel.isLoading.value
                ? [
                    CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    ),
                  ]
                : [
                    IconButton(
                      onPressed: () =>
                          widget.viewModel.executeCommand(widget.user),
                      icon: Icon(
                        widget.viewModel.isInList.value
                            ? Icons.delete
                            : Icons.save,
                      ),
                    ),
                  ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            UserHeaderWidget(user: widget.user),
            const Divider(),
            UserPersonalInfoWidget(user: widget.user),
            UserLocalizationInfoWidget(user: widget.user),
            UserLoginInfoWidget(user: widget.user),
            UserDOBInfoWidget(user: widget.user),
            UserIdInfoWidget(user: widget.user),
          ],
        ),
      ),
    );
  }
}
