import 'dart:math';

import 'package:mobile/models/organization.dart';

final organizationsList = [
  Organization(
    id: 1,
    name: "Green shelter",
  ),
  Organization(
    id: 2,
    name: "Pasta cafe",
  ),
  Organization(
    id: 3,
    name: "NH4Ukraine.org",
  ),
];

class OrganizationRepository {
  OrganizationRepository();

  Future<List<Organization>> getAll() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => organizationsList,
    );
  }

  Future<Organization> getOrCreate(String name) {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        var organization =
            organizationsList.where((o) => o.name == name).firstOrNull;

        if (organization == null) {
          organization = Organization(
            id: Random().nextInt(1000) + 100,
            name: name,
          );
          organizationsList.add(organization);
        }

        return organization;
      },
    );
  }
}
