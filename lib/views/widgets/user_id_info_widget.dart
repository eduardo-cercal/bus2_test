import 'package:bus2_test/view_models/entities/user_entity.dart';
import 'package:bus2_test/views/widgets/user_info_expasion_tile.dart';
import 'package:bus2_test/views/widgets/user_info_list_tile.dart';
import 'package:flutter/material.dart';

class UserIdInfoWidget extends StatelessWidget {
  const UserIdInfoWidget({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return UserInfoExpansionTile(
      title: "Identificação (ID)",
      icon: Icons.badge,
      children: [
        UserInfoListTile(
          label: "Tipo",
          value: user.idEntity.name,
          icon: Icons.info_outline,
        ),
        UserInfoListTile(
          label: "Valor",
          value: user.idEntity.value ?? "N/A",
          icon: Icons.numbers,
        ),
      ],
    );
  }
}
