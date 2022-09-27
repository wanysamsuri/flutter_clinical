import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final baseUrl = '';

  Future userLogin(String email, String password, String nric,
      String deviceName, String playerId) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final headerToken = storage.getString('token');

    final endpointLogin='';

    final body={};

    final response='';

    final responseBody='';

    return responseBody;
  }
}
