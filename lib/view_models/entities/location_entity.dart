import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/view_models/entities/coordinates_entity.dart';
import 'package:bus2_test/view_models/entities/entity.dart';
import 'package:bus2_test/view_models/entities/street_entity.dart';
import 'package:bus2_test/view_models/entities/time_zone_entity.dart';
import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable implements Entity {
  final StreetEntity streetEntity;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final CoordinatesEntity coordinatesEntity;
  final TimeZoneEntity timeZoneEntity;

  const LocationEntity({
    required this.streetEntity,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinatesEntity,
    required this.timeZoneEntity,
  });

  factory LocationEntity.fromJson(Map<String, dynamic> json) => LocationEntity(
    streetEntity: .fromJson(json[Mapper.street]),
    city: json[Mapper.city],
    state: json[Mapper.state],
    country: json[Mapper.country],
    postcode: json[Mapper.postcode].toString(),
    coordinatesEntity: .fromJson(json[Mapper.coordinates]),
    timeZoneEntity: .fromJson(json[Mapper.timezone]),
  );

  @override
  Map<String, dynamic> toJson() => {
    Mapper.street: streetEntity.toJson(),
    Mapper.city: city,
    Mapper.state: state,
    Mapper.country: country,
    Mapper.postcode: postcode,
    Mapper.coordinates: coordinatesEntity.toJson(),
    Mapper.timezone: timeZoneEntity.toJson(),
  };

  @override
  List<Object?> get props => [
    streetEntity,
    city,
    state,
    country,
    postcode,
    coordinatesEntity,
    timeZoneEntity,
  ];
}
