import 'package:bus2_test/view_models/entities/user_entity.dart';
import 'package:flutter/material.dart';

class UserHeaderWidget extends StatelessWidget {
  const UserHeaderWidget({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(user.pictureEntity.large),
            backgroundColor: Colors.grey[200],
          ),
          const SizedBox(height: 15),
          Text(
            "${user.nameEntity.title} ${user.nameEntity.first} ${user.nameEntity.last}",
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
