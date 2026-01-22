import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/view_model/entities/entity.dart';
import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable implements Entity {
  final String uuid;
  final String username;
  final String password;
  final String salt;
  final String md5;
  final String sha1;
  final String sha256;

  const LoginEntity({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });

  factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
    uuid: json[Mapper.uuid],
    username: json[Mapper.username],
    password: json[Mapper.password],
    salt: json[Mapper.salt],
    md5: json[Mapper.md5],
    sha1: json[Mapper.sha1],
    sha256: json[Mapper.sha256],
  );

  @override
  Map<String, dynamic> toJson() => {
    Mapper.uuid: uuid,
    Mapper.username: username,
    Mapper.password: password,
    Mapper.salt: salt,
    Mapper.md5: md5,
    Mapper.sha1: sha1,
    Mapper.sha256: sha256,
  };

  @override
  List<Object?> get props => [
    uuid,
    username,
    password,
    salt,
    md5,
    sha1,
    sha256,
  ];
}
