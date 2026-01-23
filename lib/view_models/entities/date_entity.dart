import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/view_models/entities/entity.dart';
import 'package:equatable/equatable.dart';

class DateEntity extends Equatable implements Entity {
  final DateTime date;
  final int age;

  const DateEntity({required this.date, required this.age});

  factory DateEntity.fromJson(Map<String, dynamic> json) =>
      DateEntity(date: .parse(json[Mapper.date]), age: json[Mapper.age]);

  @override
  Map<String, dynamic> toJson() => {
    Mapper.date: date.toString(),
    Mapper.age: age,
  };

  @override
  List<Object?> get props => [date, age];
}
