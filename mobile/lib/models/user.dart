import 'package:mobile/models/organization.dart';

class User {
  int id;
  String name;
  String? email;
  String? phone;
  String? photoPath;
  String password;
  String about;
  String? donationLink;
  Organization organization;

  User({
    this.email,
    this.phone,
    required this.id,
    required this.name,
    required this.password,
    required this.about,
    required this.organization,
  });
}
