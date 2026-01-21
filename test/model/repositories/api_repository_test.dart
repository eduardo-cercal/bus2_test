import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../testing/fakes.dart';


class MockApiService extends Mock implements ApiService{};

void main() {
  ApiService apiService;
  ApiRepository sut;
  UserEntity userEntity;

  setUp(() {
    apiService = MockApiService();
    sut = .new(apiService);
    userEntity = mockUserEntity();
  });

  test(
    'Deve retornar uma UserViewModel quando receber um JSON da service',
    () async {
      when(() => apiService.get()).thenAnswer((_) async => mockMap);

      final result = await sut.get();

      expect(result, mockUserViewModel);
    },
  );
}
