import 'package:adove/app/data/models/hour.dart';
import 'package:adove/app/data/models/job.dart';
import 'package:adove/app/data/models/store.dart';
import 'package:adove/app/data/models/user.dart';

class Event {
  int ?id;
  String ?date;
  Hour ?hour;
  User ?user;
  Job ?job;
  Store ?store;

  Event({this.id, this.date, this.hour, this.user, this.job, this.store});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    hour = json['hour'] != null ? Hour.fromJson(json['hour']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    job = json['job'] != null ? Job.fromJson(json['job']) : null;
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    if (hour != null) {
      data['hour'] = hour!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (job != null) {
      data['job'] = job!.toJson();
    }
     if (store != null) {
      data['store'] = store!.toJson();
    }
    return data;
  }
}
