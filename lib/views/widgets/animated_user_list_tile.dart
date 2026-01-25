import 'package:bus2_test/utils/route_name.dart';
import 'package:bus2_test/view_models/entities/user_entity.dart';
import 'package:bus2_test/views/widgets/user_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/mapper.dart';

class AnimatedUserListTile extends StatelessWidget {
  const AnimatedUserListTile({
    super.key,
    required this.item,
    required this.animation,
  });

  final UserEntity item;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: UserListTile(
        item: item,
        onTap: () =>
            Get.toNamed(RouteName.userDetails, arguments: {Mapper.user: item}),
      ),
    );
  }
}
