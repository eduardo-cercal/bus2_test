import 'package:bus2_test/view_models/entities/entity.dart';
import 'package:equatable/equatable.dart';

abstract class GenericWithNameEntity extends Equatable implements Entity {
  final String name;

  const GenericWithNameEntity({required this.name});
}
