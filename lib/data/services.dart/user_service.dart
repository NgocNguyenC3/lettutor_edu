import 'package:lettutor_edu_clone/data/api_constants.dart';
import 'package:lettutor_edu_clone/data/services.dart/base_service.dart';

class UserService extends BaseService {
  Future<dynamic> login(
      {required String email, required String password}) async {
    final body = {"email": email, "password": password};

    var response = await post(LOGIN, data: body);
    print(response);
    return response;
  }
}
