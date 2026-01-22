import 'package:bus2_test/model/repositories/api_repository.dart';
import 'package:bus2_test/model/services/api_service.dart';
import 'package:bus2_test/utils/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../testing/fakes.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late ApiService apiService;
  late ApiRepository sut;

  setUp(() {
    apiService = MockApiService();
    sut = .new(apiService);
  });

  test(
    'Deve retornar uma UserEntity quando receber um JSON da service',
    () async {
      when(() => apiService.get()).thenAnswer((_) async => mockJson);

      final result = await sut.getFirstUser();

      expect(result, mockUserEntity);
    },
  );

  test('Deve relançar uma Failure quando receber a Failure ', () {
    when(() => apiService.get()).thenThrow(UnexpectedFailure());

    final failure = sut.getFirstUser();

    expect(failure, throwsA(TypeMatcher<Failures>()));
  });
}
