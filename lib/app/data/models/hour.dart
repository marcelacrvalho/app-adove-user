class Hour{
  int ?id;
  String ?hour;

  Hour({this.id, this.hour});

  Hour.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hour = json['hour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hour'] = hour;
    return data;
  }
}