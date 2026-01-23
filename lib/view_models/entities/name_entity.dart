import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/view_models/entities/entity.dart';
import 'package:equatable/equatable.dart';

class NameEntity extends Equatable implements Entity {
  final String title;
  final String first;
  final String last;

  const NameEntity({
    required this.title,
    required this.first,
    required this.last,
  });

  factory NameEntity.fromJson(Map<String, dynamic> json) => NameEntity(
    title: json[Mapper.title],
    first: json[Mapper.first],
    last: json[Mapper.last],
  );

  @override
  Map<String, dynamic> toJson() => {
    Mapper.title: title,
    Mapper.first: first,
    Mapper.last: last,
  };

  @override
  List<Object?> get props => [title, first, last];
}
