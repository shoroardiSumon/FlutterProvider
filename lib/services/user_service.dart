import 'package:flutterprovider/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {

  Future<List<UserModel>> fetchUsers() async {
    try {
      String url = "https://jsonplaceholder.typicode.com/users";
      
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
       // List<dynamic> jsonData = json.decode(response.body);
        List<UserModel> fetchedUsers = [];

        // for (var element in jsonData) {
        //   fetchedUsers.add(UserModel.fromJson(element));
        // }

        fetchedUsers = userModelFromJson(response.body);

        return fetchedUsers;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

}