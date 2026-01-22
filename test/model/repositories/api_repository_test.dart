import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../testing/fakes.dart';


class MockApiService extends Mock implements ApiService{};

void main() {
  ApiService apiService;
  ApiRepository sut;

  setUp(() {
    apiService = MockApiService();
    sut = .new(apiService);
  });

  test(
    'Deve retornar uma UserViewModel quando receber um JSON da service',
    () async {
      when(() => apiService.get()).thenAnswer((_) async => mockJson);

      final result = await sut.getFirstUser();

      expect(result, mockUserEntity);
    },
  );
}
