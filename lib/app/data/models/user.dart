class User {
  int? id;
  String? name;
  String? email;
  String? location;
  String? neighborhood;
  String? street;
  String? number;
  String? firebaseToken;

  User({
    this.id,
    this.name,
    this.email,
    this.location,
    this.neighborhood,
    this.street,
    this.number,
    this.firebaseToken,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    location = json['location'];
    neighborhood = json['neighborhood'];
    street = json['street'];
    number = json['number'];
    firebaseToken = json['firebaseToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['location'] = location;
    data['neighborhood'] = neighborhood;
    data['street'] = street;
    data['number'] = number;
    data['firebaseToken'] = firebaseToken;
    return data;
  }
}
