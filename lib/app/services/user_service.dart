import 'package:xingu_experience/app/models/user.dart';

class UserService {
  Future<User> getUserByUsername(String username) async {
    return User(
      name: 'Paulo Vitor',
      username: 'pvitor',
      email: 'vitor@gmail.com',
      avatar: 'assets/users_avatar/pvitor.jpg',
    );
  }
}
