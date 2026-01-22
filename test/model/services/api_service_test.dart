import 'package:bus2_test/model/services/api_service.dart';
import 'package:bus2_test/utils/failures.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

import '../../../testing/fakes.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio dio;
  late ApiService sut;

  setUp(() {
    dio = MockDio();
    sut = .new(dio);
  });

  test('Quando chamar a String do http deve retornar um JSON', () async {
    when(() => dio.get(any())).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: mockJson,
        requestOptions: RequestOptions(),
      ),
    );

    final result = await sut.get();

    expect(result, mockJson);

    verify(() => dio.get('https://randomuser.me/api/')).called(1);
  });

  test(
    'Quando a requisição nao der certo, deve lancar uma UnexpectedFailure',
    () {
      when(() => dio.get(any())).thenThrow(Exception());

      final failure = sut.get();

      expect(failure, throwsA(TypeMatcher<UnexpectedFailure>()));
    },
  );
  test('Quando receber um resposta com 500, deve lancar uma ServerFailure', () {
    when(() => dio.get(any())).thenAnswer(
      (_) async =>
          Response(statusCode: 500, data: {}, requestOptions: RequestOptions()),
    );

    final failure = sut.get();

    expect(failure, throwsA(TypeMatcher<ServerFailure>()));
  });

  test(
    'Quando receber um resposta com 404, deve lancar uma NotFounFailure',
    () {
      when(() => dio.get(any())).thenAnswer(
        (_) async => Response(
          statusCode: 404,
          data: mockJson,
          requestOptions: RequestOptions(),
        ),
      );
      final failure = sut.get();

      expect(failure, throwsA(TypeMatcher<NotFoundFailure>()));
    },
  );

  test(
    'Quando receber um resposta com um statusCode não tratado, deve lancar uma UnexpectedFailure',
    () {
      when(() => dio.get(any())).thenAnswer(
        (_) async => Response(
          statusCode: 401,
          data: mockJson,
          requestOptions: RequestOptions(),
        ),
      );

      final failure = sut.get();

      expect(failure, throwsA(TypeMatcher<UnexpectedFailure>()));
    },
  );
}
