import 'address.dart';

var user = {
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {"lat": "-37.3159", "lng": "81.1496"}
  },
  "phone": "1-770-736-8031 x56442",
  "website": "hildegard.org",
  "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
  }
};

class User {
  final int idd;
  final String name, username, email, phone, website;
  final Address address;
  final String companyName;
  final String lat, long;
  User(
      {required this.idd,
      required this.name,
      required this.username,
      required this.email,
      required this.phone,
      required this.address,
      required this.companyName,
      required this.lat,
      required this.long,
      required this.website});

  static User convertFromJson(Map json) {
    return User(
      idd: json["id"],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      lat: json["address"]["geo"]["lat"],
      long: json["address"]["geo"]["lng"], //null
      address: Address.convertFromJson(json['address']),
      companyName: json['company']["name"],
    );
  }
}
