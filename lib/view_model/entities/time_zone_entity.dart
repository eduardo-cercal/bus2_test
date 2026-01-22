import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/view_model/entities/entity.dart';
import 'package:equatable/equatable.dart';

class TimeZoneEntity extends Equatable implements Entity {
  final String offset;
  final String description;

  const TimeZoneEntity({required this.offset, required this.description});

  factory TimeZoneEntity.fromJson(Map<String, dynamic> json) => TimeZoneEntity(
    offset: json[Mapper.offset],
    description: json[Mapper.description],
  );

  @override
  Map<String, dynamic> toJson() => {
    Mapper.offset: offset,
    Mapper.description: description,
  };

  @override
  List<Object?> get props => [offset, description];
}
