import 'package:bus2_test/model/services/database_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

import '../../../testing/fakes.dart';

class MockBox extends Mock implements Box {}

void main() {
  late Box box;
  late DatabaseService sut;

  setUp(() {
    box = MockBox();
    sut = .new(box);
  });

  test('Deve retornar a lista de Users quando chamado', () async {
    when(() => box.get(any())).thenAnswer((_) async => mockJsonList);

    final result = await sut.getUserList();

    expect(result, mockJsonList);
  });
}
