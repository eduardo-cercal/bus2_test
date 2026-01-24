import 'package:bus2_test/view_models/entities/user_entity.dart';
import 'package:bus2_test/views/widgets/user_info_expasion_tile.dart';
import 'package:bus2_test/views/widgets/user_info_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserDOBInfoWidget extends StatelessWidget {
  const UserDOBInfoWidget({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return UserInfoExpansionTile(
      title: "Datas e Registros",
      icon: Icons.calendar_today,
      children: [
        UserInfoListTile(
          label: "Nascimento",
          value: DateFormat(
            'dd/MM/yyyy - hh:mm:ss',
          ).format(user.dobEntity.date),
          icon: Icons.cake,
        ),
        UserInfoListTile(
          label: "Idade",
          value: "${user.dobEntity.age} anos",
          icon: Icons.history,
        ),
        UserInfoListTile(
          label: "Data de Registro",
          value: DateFormat(
            'dd/MM/yyyy - hh:mm:ss',
          ).format(user.registerEntity.date),
          icon: Icons.app_registration,
        ),
        UserInfoListTile(
          label: "Anos de Registro",
          value: "${user.registerEntity.age} anos",
          icon: Icons.timer,
        ),
      ],
    );
  }
}
