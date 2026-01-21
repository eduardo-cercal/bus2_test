import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/view_model/entities/entity.dart';
import 'package:equatable/equatable.dart';

interface class GenericWithNameEntity extends Equatable implements Entity {
  final String name;

  const GenericWithNameEntity({required this.name});

  @override
  Map<String, dynamic> toJson() => {Mapper.name: name};

  @override
  List<Object?> get props => [name];
}
