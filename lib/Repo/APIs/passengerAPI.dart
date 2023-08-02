import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:green_route_mobile/Models/Carpool/GetPassengerMyRides.dart';
import 'package:green_route_mobile/Models/Carpool/PassengerGetRide.dart';
import 'package:green_route_mobile/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'local.dart';

Future<PassengerGetRides?> passengerGetRides({required String from, required String to, required String date})async {
  try {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.get("token").toString();
    var response = await http.post(Uri.parse(base_url + get_rides),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          "userId": preferences.get("userId"),
          "from": from,
          "to": to,
          "date": date
        });
    print(response.statusCode);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return PassengerGetRides.fromJson(jsonDecode(response.body));
    }
    return null;
  }
  catch (e){
    print(e);
    return null;
  }
}

Future<bool> bookRide(String rideId)async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var response  = await http.post(Uri.parse(base_url+book_rides),body: {
    "userId":preferences.get("userId"),
    "rideID": rideId
  },headers: {
    "Authorization": "Bearer ${preferences.get("token")}"
  }
  );
  if (response.statusCode>=200&&response.statusCode<=300){
    return true;
  }
  else {
    return false;
  }

}
Future<GetPassengerMyRides?> pGetMyRides()async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var response = await http.get(Uri.parse(base_url+get_my_booked_rides(preferences.get("userId").toString())), headers: {
    "Authorization":"Bearer ${preferences.get("token")}"
  });
  if(response.statusCode>=200&&response.statusCode<300){
    print(response.body);
  return GetPassengerMyRides.fromJson(jsonDecode(response.body));}
  else{
    return null;
  }

}
Future<bool> cancelPassengerRideAPI(String rideId) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.get("token").toString();
  var response = await http.post(Uri.parse(base_url+cancel_rides), headers: {
    'Authorization': 'Bearer $token',
  },
  body: {
    "userId":preferences.get("userId"),
    "rideID":rideId
  });
  print(response.statusCode);
  if(response.statusCode>=200&&response.statusCode<300){
    print(response.body);
    return true;}
  else{
    return false;
  }
}