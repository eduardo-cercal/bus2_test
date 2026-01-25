import 'package:bus2_test/view_models/saved_user_list_view_model.dart';
import 'package:bus2_test/views/widgets/user_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/mapper.dart';
import '../utils/route_name.dart';

class SavedUserListView extends StatefulWidget {
  const SavedUserListView({super.key, required this.viewModel});

  final SavedUserListViewModel viewModel;

  @override
  State<SavedUserListView> createState() => _SavedUserListViewState();
}

class _SavedUserListViewState extends State<SavedUserListView> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getSavedUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuários salvos')),
      body: Padding(
        padding: .all(8),
        child: Obx(() {
          if (widget.viewModel.isLoading.value) {
            return Center(child: CircularProgressIndicator.adaptive());
          }

          if (widget.viewModel.failure.value != null) {
            return Center(
              child: Text(
                widget.viewModel.failure.value!,
                style: TextStyle(fontWeight: .bold, fontSize: 18),
              ),
            );
          }
          return ListView.builder(
            itemCount: widget.viewModel.userList.length,
            itemBuilder: (context, index) => UserListTile(
              item: widget.viewModel.userList[index],
              onTap: () async {
                final isRemoved = await Get.toNamed(
                  RouteName.userDetails,
                  arguments: {Mapper.user: widget.viewModel.userList[index]},
                );
                if (isRemoved) {
                  widget.viewModel.userList.remove(
                    widget.viewModel.userList[index],
                  );
                }
              },
            ),
          );
        }),
      ),
    );
  }
}
