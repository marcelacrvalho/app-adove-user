
import 'package:adove/app/data/models/store.dart';

class Job {
  int ?id;
  String ?job;
  String ?price;
  String ?description;
  Store ?store;

  Job({this.id, this.job, this.price, this.description, this.store});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    job = json['job'];
    price = json['price'];
    description = json['description'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job'] = job;
    data['price'] = price;
    data['description'] = description;
    if (store != null) {
      data['store'] = store!.toJson();
    }
    return data;
  }
}