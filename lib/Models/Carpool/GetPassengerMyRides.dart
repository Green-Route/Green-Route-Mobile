// To parse this JSON data, do
//
//     final getPassengerMyRides = getPassengerMyRidesFromJson(jsonString);

import 'dart:convert';

GetPassengerMyRides getPassengerMyRidesFromJson(String str) => GetPassengerMyRides.fromJson(json.decode(str));

String getPassengerMyRidesToJson(GetPassengerMyRides data) => json.encode(data.toJson());

class GetPassengerMyRides {
  List<Ride> rides;

  GetPassengerMyRides({
    required this.rides,
  });

  factory GetPassengerMyRides.fromJson(Map<String, dynamic> json) => GetPassengerMyRides(
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
  int seat;

  Ride({
    required this.id,
    required this.from,
    required this.to,
    required this.date,
    required this.time,
    required this.riderId,
    required this.price,
    required this.seat,
  });

  factory Ride.fromJson(Map<String, dynamic> json) => Ride(
    id: json["_id"],
    from: json["from"],
    to: json["to"],
    date: json["date"],
    time: json["time"],
    riderId: json["riderID"],
    price: json["price"],
    seat: json["seat"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "from": from,
    "to": to,
    "date": date,
    "time": time,
    "riderID": riderId,
    "price": price,
    "seat": seat,
  };
}
