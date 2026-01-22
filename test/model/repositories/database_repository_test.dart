import 'package:bus2_test/model/repositories/database_repository.dart';
import 'package:bus2_test/model/services/database_service.dart';
import 'package:bus2_test/utils/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../testing/fakes.dart';

class MockDatabaseService extends Mock implements DatabaseService {}

void main() {
  late DatabaseService databaseService;
  late DatabaseRepository sut;

  setUp(() {
    databaseService = MockDatabaseService();
    sut = .new(databaseService);
  });

  group('get User List', () {
    test(
      'Quando receber uma lista de Json deve retonar uma lista de UserEntity',
      () async {
        when(
          () => databaseService.getUserList(),
        ).thenAnswer((_) async => mockJsonList);

        final result = await sut.getUserList();

        expect(result, mockUserList);
      },
    );

    test('Quando receber uma lista vazia deve lançar uma Failure', () async {
      when(() => databaseService.getUserList()).thenAnswer((_) async => []);

      final failure = sut.getUserList();

      expect(failure, throwsA(isA<EmptyListFailure>()));
    });
  });
}
