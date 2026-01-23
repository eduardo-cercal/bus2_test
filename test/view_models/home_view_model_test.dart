import 'package:bus2_test/model/repositories/api_repository.dart';
import 'package:bus2_test/model/repositories/database_repository.dart';
import 'package:bus2_test/utils/failures.dart';
import 'package:bus2_test/view_models/entities/user_entity.dart';
import 'package:bus2_test/view_models/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../testing/fakes.dart';

class MockApiRepository extends Mock implements ApiRepository {}

class MockDatabaseRepository extends Mock implements DatabaseRepository {}

void main() {
  late ApiRepository apiRepository;
  late DatabaseRepository databaseRepository;
  late HomeViewModel sut;

  setUp(() {
    apiRepository = MockApiRepository();
    databaseRepository = MockDatabaseRepository();
    sut = .new(
      apiRepository: apiRepository,
      databaseRepository: databaseRepository,
    );
  });

  group('Get User', () {
    test(
      'Deve preencher o atributo quando receber valores da chamada',
      () async {
        when(
          () => apiRepository.getFirstUser(),
        ).thenAnswer((_) async => mockUserEntity);

        final result = await sut.getUser();

        expect(result, mockUserEntity);
      },
    );

    test(
      'Quando receber um Failure deve atribuir a mensagem de erro ao atributo',
      () {
        when(() => apiRepository.getFirstUser()).thenThrow(ServerFailure());

        final failure = sut.getUser();

        expect(failure, throwsA(isA<Failures>()));
      },
    );
  });

  group('Save User', () {
    setUp(() => registerFallbackValue(mockUserEntity));

    test('Deve salvar o usuario quando realizar a chamada', () async {
      when(
        () => databaseRepository.saveUser(
          user: any(named: 'user'),
          list: any(named: 'list'),
        ),
      ).thenAnswer((_) async {});

      await sut.saveUser(user: mockUserEntity, list: mockUserList);

      verify(
        () => databaseRepository.saveUser(
          user: mockUserEntity,
          list: mockUserList,
        ),
      ).called(1);
    });
  });
}
