// To parse this JSON data, do
//
//     final postedRide = postedRideFromJson(jsonString);

import 'dart:convert';

PostedRide postedRideFromJson(String str) => PostedRide.fromJson(json.decode(str));

String postedRideToJson(PostedRide data) => json.encode(data.toJson());

class PostedRide {
  List<Ride> rides;

  PostedRide({
    required this.rides,
  });

  factory PostedRide.fromJson(Map<String, dynamic> json) => PostedRide(
    rides: List<Ride>.from(json["rides"].map((x) => Ride.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "rides": List<dynamic>.from(rides.map((x) => x.toJson())),
  };
}

class Ride {
  String id;
  String from;
  String to;
  String date;
  String time;
  String riderId;
  String price;
  List<String> passengers;
  int seat;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Ride({
    required this.id,
    required this.from,
    required this.to,
    required this.date,
    required this.time,
    required this.riderId,
    required this.price,
    required this.passengers,
    required this.seat,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Ride.fromJson(Map<String, dynamic> json) => Ride(
    id: json["_id"],
    from: json["from"],
    to: json["to"],
    date: json["date"],
    time: json["time"],
    riderId: json["riderID"],
    price: json["price"],
    passengers: List<String>.from(json["passengers"].map((x) => x)),
    seat: json["seat"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "from": from,
    "to": to,
    "date": date,
    "time": time,
    "riderID": riderId,
    "price": price,
    "passengers": List<dynamic>.from(passengers.map((x) => x)),
    "seat": seat,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
