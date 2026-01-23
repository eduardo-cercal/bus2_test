import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/view_models/entities/entity.dart';
import 'package:equatable/equatable.dart';

class PictureEntity extends Equatable implements Entity {
  final String large;
  final String medium;
  final String thumbnail;

  const PictureEntity({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory PictureEntity.fromJson(Map<String, dynamic> json) => PictureEntity(
    large: json[Mapper.large],
    medium: json[Mapper.medium],
    thumbnail: json[Mapper.thumbnail],
  );

  @override
  Map<String, dynamic> toJson() => {
    Mapper.large: large,
    Mapper.medium: medium,
    Mapper.thumbnail: thumbnail,
  };

  @override
  List<Object?> get props => [large, medium, thumbnail];
}
