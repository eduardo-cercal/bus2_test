import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/view_model/entities/generic_with_name_entity.dart';

class StreetEntity extends GenericWithNameEntity {
  final int number;

  const StreetEntity({required super.name, required this.number});

  factory StreetEntity.fromJson(Map<String, dynamic> json) =>
      StreetEntity(name: json[Mapper.name], number: json[Mapper.number]);

  @override
  Map<String, dynamic> toJson() => {Mapper.name: name, Mapper.number: number};

  @override
  List<Object?> get props => [name, number];
}
