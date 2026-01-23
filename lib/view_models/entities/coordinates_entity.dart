import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/view_models/entities/entity.dart';
import 'package:equatable/equatable.dart';

class CoordinatesEntity extends Equatable implements Entity {
  final String latitude;
  final String longitude;

  const CoordinatesEntity({required this.latitude, required this.longitude});

  factory CoordinatesEntity.fromJson(Map<String, dynamic> json) =>
      CoordinatesEntity(
        latitude: json[Mapper.latitude],
        longitude: json[Mapper.longitude],
      );

  @override
  Map<String, dynamic> toJson() => {
    Mapper.latitude: latitude,
    Mapper.longitude: longitude,
  };

  @override
  List<Object?> get props => [latitude, longitude];
}
