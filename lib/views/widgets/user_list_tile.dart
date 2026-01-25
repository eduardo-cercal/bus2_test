import 'package:bus2_test/view_models/entities/user_entity.dart';
import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key, required this.item, required this.onTap});

  final UserEntity item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.pictureEntity.thumbnail),
        ),
        title: Text(
          '${item.nameEntity.title}.${item.nameEntity.first} ${item.nameEntity.last}',
        ),

        onTap: onTap,
      ),
    );
  }
}
