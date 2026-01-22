import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/view_model/entities/generic_with_name_entity.dart';

class IdEntity extends GenericWithNameEntity {
  final String value;

  const IdEntity({required super.name, required this.value});

  factory IdEntity.fromJson(Map<String, dynamic> json) =>
      IdEntity(name: json[Mapper.name], value: json[Mapper.value]);

  @override
  Map<String, dynamic> toJson() => {Mapper.name: name, Mapper.value: value};

  @override
  List<Object?> get props => [name, value];
}
