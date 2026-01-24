import 'package:bus2_test/model/services/api_service.dart';
import 'package:dio/dio.dart';

ApiService apiServiceFactory() => ApiService(Dio());
