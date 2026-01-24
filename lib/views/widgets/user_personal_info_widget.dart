import 'package:bus2_test/view_models/entities/user_entity.dart';
import 'package:bus2_test/views/widgets/user_info_list_tile.dart';
import 'package:flutter/material.dart';

class UserPersonalInfoWidget extends StatelessWidget {
  const UserPersonalInfoWidget({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 16, bottom: 8),
          child: Text(
            'Informações Pessoais',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              UserInfoListTile(
                label: "Gênero",
                value: user.gender,
                icon: Icons.person,
              ),
              UserInfoListTile(
                label: "Nacionalidade",
                value: user.nat,
                icon: Icons.flag,
              ),
              UserInfoListTile(
                label: "E-mail",
                value: user.email,
                icon: Icons.email,
              ),
              UserInfoListTile(
                label: "Telefone",
                value: user.phone,
                icon: Icons.phone,
              ),
              UserInfoListTile(
                label: "Celular",
                value: user.cell,
                icon: Icons.smartphone,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
