class Store {
  int? id;
  String? name;
  String? payment;
  String? open;
  bool? homecare;
  String? location;
  String? street;
  String? neighborhood;
  String? number;
  String? firebaseToken;

  Store(
      {this.id,
      this.name,
      this.payment,
      this.open,
      this.homecare,
      this.location,
      this.street,
      this.neighborhood,
      this.number,
      this.firebaseToken});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    payment = json['payment'];
    open = json['open'];
    homecare = json['homecare'];
    location = json['location'];
    street = json['street'];
    neighborhood = json['neighborhood'];
    number = json['number'];
    firebaseToken = json['firebaseToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['payment'] = payment;
    data['open'] = open;
    data['homecare'] = homecare;
    data['location'] = location;
    data['street'] = street;
    data['neighborhood'] = neighborhood;
    data['number'] = number;
    data['firebaseToken'] = firebaseToken;
    return data;
  }
}
