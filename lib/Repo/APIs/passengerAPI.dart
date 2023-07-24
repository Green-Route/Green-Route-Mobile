import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:green_route/Models/Carpool/PassengerGetRide.dart';
import 'package:green_route/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
