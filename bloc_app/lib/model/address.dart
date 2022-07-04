var address = {
  "street": "Kulas Light",
  "suite": "Apt. 556",
  "city": "Gwenborough",
  "zipcode": "92998-3874",
  "geo": {"lat": "-37.3159", "lng": "81.1496"}
};

class Address {
  final String street, suite, city, zipcode;
  final Geo geo;
  final String lat;
  final String long;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo,
      required this.lat,
      required this.long});
  static Address convertFromJson(Map jack) {
    return Address(
        street: jack['street'] ?? "Baneshwor",
        suite: jack['suite'] ?? " ",
        city: jack['city'] ?? "",
        zipcode: jack['zipcode'] ?? "44600",
        geo: Geo.fromJson(jack['geo']),
        lat: jack['geo']['lat'],
        long: jack['geo']['lng']);
  }
}

class Geo {
  final String latitude, longitude;

  Geo({required this.latitude, required this.longitude});

  factory Geo.fromJson(Map json) {
    return Geo(latitude: json['lat'], longitude: json['lng']);
  }
}
