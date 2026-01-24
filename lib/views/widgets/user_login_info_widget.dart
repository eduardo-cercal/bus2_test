import 'package:bus2_test/view_models/entities/user_entity.dart';
import 'package:bus2_test/views/widgets/user_info_expasion_tile.dart';
import 'package:bus2_test/views/widgets/user_info_list_tile.dart';
import 'package:flutter/material.dart';

class UserLoginInfoWidget extends StatelessWidget {
  const UserLoginInfoWidget({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return UserInfoExpansionTile(
      title: "Dados de Login & Segurança",
      icon: Icons.lock,
      children: [
        UserInfoListTile(
          label: "UUID",
          value: user.loginEntity.uuid,
          icon: Icons.fingerprint,
        ),
        UserInfoListTile(
          label: "Username",
          value: user.loginEntity.username,
          icon: Icons.alternate_email,
        ),
        UserInfoListTile(
          label: "Senha",
          value: user.loginEntity.password,
          icon: Icons.password,
        ),
        UserInfoListTile(
          label: "Salt",
          value: user.loginEntity.salt,
          icon: Icons.security,
        ),
        UserInfoListTile(
          label: "MD5",
          value: user.loginEntity.md5,
          icon: Icons.code,
        ),
        UserInfoListTile(
          label: "SHA1",
          value: user.loginEntity.sha1,
          icon: Icons.code,
        ),
        UserInfoListTile(
          label: "SHA256",
          value: user.loginEntity.sha256,
          icon: Icons.code,
        ),
      ],
    );
  }
}
