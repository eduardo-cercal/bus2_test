import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/view_models/entities/date_entity.dart';
import 'package:bus2_test/view_models/entities/entity.dart';
import 'package:bus2_test/view_models/entities/id_entity.dart';
import 'package:bus2_test/view_models/entities/location_entity.dart';
import 'package:bus2_test/view_models/entities/login_entity.dart';
import 'package:bus2_test/view_models/entities/name_entity.dart';
import 'package:bus2_test/view_models/entities/picture_entity.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable implements Entity {
  final String gender;
  final NameEntity nameEntity;
  final LocationEntity locationEntity;
  final String email;
  final LoginEntity loginEntity;
  final DateEntity dobEntity;
  final DateEntity registerEntity;
  final String phone;
  final String cell;
  final IdEntity idEntity;
  final PictureEntity pictureEntity;
  final String nat;

  const UserEntity({
    required this.gender,
    required this.nameEntity,
    required this.locationEntity,
    required this.email,
    required this.loginEntity,
    required this.dobEntity,
    required this.registerEntity,
    required this.phone,
    required this.cell,
    required this.idEntity,
    required this.pictureEntity,
    required this.nat,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
    gender: json[Mapper.gender],
    nameEntity: .fromJson(json[Mapper.name]),
    locationEntity: .fromJson(json[Mapper.location]),
    email: json[Mapper.email],
    loginEntity: .fromJson(json[Mapper.login]),
    dobEntity: .fromJson(json[Mapper.dob]),
    registerEntity: .fromJson(json[Mapper.registered]),
    phone: json[Mapper.phone],
    cell: json[Mapper.cell],
    idEntity: .fromJson(json[Mapper.id]),
    pictureEntity: .fromJson(json[Mapper.picture]),
    nat: json[Mapper.nat],
  );

  @override
  Map<String, dynamic> toJson() => {
    Mapper.gender: gender,
    Mapper.name: nameEntity.toJson(),
    Mapper.location: locationEntity.toJson(),
    Mapper.email: email,
    Mapper.login: loginEntity.toJson(),
    Mapper.dob: dobEntity.toJson(),
    Mapper.registered: registerEntity.toJson(),
    Mapper.phone: phone,
    Mapper.cell: cell,
    Mapper.id: idEntity.toJson(),
    Mapper.picture: pictureEntity.toJson(),
    Mapper.nat: nat,
  };

  @override
  List<Object?> get props => [
    gender,
    nameEntity,
    locationEntity,
    email,
    loginEntity,
    dobEntity,
    registerEntity,
    phone,
    cell,
    idEntity,
    pictureEntity,
    nat,
  ];
}
