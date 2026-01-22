import 'package:bus2_test/utils/failures.dart';
import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/utils/status_code_enum.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> get() async {
    try {
      final response = await dio.get(Mapper.apiUrl);

      _valideStatusCodeAndThrowFailure(response.statusCode!);

      return response.data;
    } on Failures {
      rethrow;
    } catch (e) {
      throw UnexpectedFailure();
    }
  }

  void _valideStatusCodeAndThrowFailure(int statusCode) {
    if (statusCode == StatusCodeEnum.success.statusCode) {
      return;
    }

    if (statusCode == StatusCodeEnum.serverFailure.statusCode) {
      throw ServerFailure();
    }

    if (statusCode == StatusCodeEnum.notFound.statusCode) {
      throw NotFoundFailure();
    }

    throw UnexpectedFailure();
  }
}
