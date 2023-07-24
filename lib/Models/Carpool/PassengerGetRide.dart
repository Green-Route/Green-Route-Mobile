// To parse this JSON data, do
//
//     final passengerGetRides = passengerGetRidesFromJson(jsonString);

import 'dart:convert';

PassengerGetRides passengerGetRidesFromJson(String str) => PassengerGetRides.fromJson(json.decode(str));

String passengerGetRidesToJson(PassengerGetRides data) => json.encode(data.toJson());

class PassengerGetRides {
  List<Datum> data;

  PassengerGetRides({
    required this.data,
  });

  factory PassengerGetRides.fromJson(Map<String, dynamic> json) => PassengerGetRides(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String from;
  String to;
  String date;
  String time;
  String riderId;
  String price;
  List<dynamic> passengers;
  int seat;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    from: json["from"],
    to: json["to"],
    date: json["date"],
    time: json["time"],
    riderId: json["riderID"],
    price: json["price"],
    passengers: List<dynamic>.from(json["passengers"].map((x) => x)),
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
