class UserModel {
  final int id;
  final String name;
  final String userName;
  final String email;
  final UserAddress? address;
  final String phone;
  final String website;
  final UserCompany? company;

  UserModel(
      {required this.id,
      required this.name,
      required this.userName,
      required this.email,
      this.address,
      required this.phone,
      required this.website,
      required this.company});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      userName: json['username'],
      email: json['email'],
      address: json['address'] != null
          ? new UserAddress.fromJson(json['address'])
          : null,
      phone: json['phone'],
      website: json['website'],
      company: json['company'] != null
          ? new UserCompany.fromJson(json['company'])
          : null,
    );
  }
}

class UserAddress {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final UserGeo? userGeo;

  UserAddress(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.userGeo});

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return UserAddress(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      userGeo: json['geo'] != null ? new UserGeo.fromJson(json['geo']) : null,
    );
  }
}

class UserGeo {
  final String lat;
  final String lng;

  UserGeo({required this.lat, required this.lng});

  factory UserGeo.fromJson(Map<String, dynamic> json) {
    return UserGeo(lat: json['lat'], lng: json['lng']);
  }
}

class UserCompany {
  final String companyName;
  final String catchPhrase;
  final String bs;

  UserCompany(
      {required this.companyName, required this.catchPhrase, required this.bs});

  factory UserCompany.fromJson(Map<String, dynamic> json) {
    return UserCompany(
        companyName: json['name'],
        catchPhrase: json['catchPhrase'],
        bs: json['bs']);
  }
}
