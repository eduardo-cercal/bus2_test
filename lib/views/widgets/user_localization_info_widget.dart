import 'package:bus2_test/view_models/entities/user_entity.dart';
import 'package:bus2_test/views/widgets/user_info_expasion_tile.dart';
import 'package:bus2_test/views/widgets/user_info_list_tile.dart';
import 'package:flutter/material.dart';

class UserLocalizationInfoWidget extends StatelessWidget {
  const UserLocalizationInfoWidget({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return UserInfoExpansionTile(
      title: "Localização",
      icon: Icons.map,
      children: [
        UserInfoListTile(
          label: "Rua",
          value:
              "${user.locationEntity.streetEntity.name}, ${user.locationEntity.streetEntity.number}",
          icon: Icons.remove,
        ),
        UserInfoListTile(
          label: "Cidade",
          value: user.locationEntity.city,
          icon: Icons.remove,
        ),
        UserInfoListTile(
          label: "Estado",
          value: user.locationEntity.state,
          icon: Icons.remove,
        ),
        UserInfoListTile(
          label: "País",
          value: user.locationEntity.country,
          icon: Icons.remove,
        ),
        UserInfoListTile(
          label: "Código Postal",
          value: user.locationEntity.postcode.toString(),
          icon: Icons.remove,
        ),
        UserInfoListTile(
          label: "Latitude",
          value: user.locationEntity.coordinatesEntity.latitude,
          icon: Icons.location_on,
        ),
        UserInfoListTile(
          label: "Longitude",
          value: user.locationEntity.coordinatesEntity.longitude,
          icon: Icons.location_on,
        ),
        UserInfoListTile(
          label: "Fuso Horário",
          value:
              "${user.locationEntity.timeZoneEntity.offset} (${user.locationEntity.timeZoneEntity.description})",
          icon: Icons.access_time,
        ),
      ],
    );
  }
}
