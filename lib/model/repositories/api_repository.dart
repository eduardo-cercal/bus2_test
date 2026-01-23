import 'package:bus2_test/model/services/api_service.dart';
import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/view_models/entities/user_entity.dart';

class ApiRepository {
  final ApiService apiService;

  ApiRepository(this.apiService);

  Future<UserEntity> getFirstUser() async {
    try {
      final result = await apiService.get();

      return .fromJson(result[Mapper.results].first);
    } catch (e) {
      rethrow;
    }
  }
}
