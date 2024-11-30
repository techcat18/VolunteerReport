import 'package:mobile/data/organization_repository.dart';
import 'package:mobile/models/user.dart';

final userList = [
  User(
    id: 1,
    email: "matt@gmail.com",
    name: "Matt",
    password: "qwerty123",
    organization: organizationsList.first,
    about:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  User(
    id: 2,
    email: "dima@gmail.com",
    name: "Dima",
    password: "qwerty123",
    organization: organizationsList.first,
    about:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
];

class UserRepository {
  UserRepository();

  Future<User> login(String login, String password) {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        final user = userList
            .where((u) =>
                (u.email == login || u.phone == login) &&
                u.password == password)
            .firstOrNull;
        if (user == null) {
          throw Exception("Invalid login or password!");
        }
        return user;
      },
    );
  }

  Future<User> register(User user) {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        final duplicate = userList
            .where((u) => (u.email == user.email || u.phone == user.phone))
            .firstOrNull;
        if (duplicate != null) {
          throw Exception("User with this email or phone already exists!");
        }
        userList.add(user);
        return user;
      },
    );
  }

  Future<void> logout() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {},
    );
  }

  Future<void> update(User user) {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        final index = userList.indexWhere((u) => u.id == user.id);
        userList[index] = user;
      },
    );
  }
}
