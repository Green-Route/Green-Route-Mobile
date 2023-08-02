import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/Carpool/PostedRide.dart';
import '../../utils/constants.dart';

Future? riderPostRide(BuildContext context, {
  required String from,
  required String to,
  required String date,
  required String time,
  required String price,
  required String seat,
}) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String userId = preferences.get("userId").toString();
var token =  preferences.get("token");
  var response = await http.post(Uri.parse(base_url+rider_post_ride),
      headers: {

        'Authorization': 'Bearer $token',
      },
      body: {
    'from':from,
    'to':to,
    'date':date,
    'time':time,
    'riderID':userId,
    'price':price,
    'seat':seat  });
  print(response.body);
  if(response.statusCode>=200&&response.statusCode<300){
    return response.statusCode.toString();
  }
  else{
    return null;
  }
}

Future<PostedRide?> riderPostedRide() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.get("token").toString();
  var response = await http.get(Uri.parse(base_url+get_rider_rides(preferences.get("userId").toString())), headers: {
    'Authorization': 'Bearer $token',
  });
  print(response.statusCode);
  if(response.statusCode>=200&&response.statusCode<300){
    print(response.body);
    return PostedRide.fromJson(jsonDecode(response.body));}
  else{
    return null;
  }
}
Future<bool> deleteRiderRideAPI(String rideId) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.get("token").toString();
  var response = await http.get(Uri.parse(base_url+rider_delete_ride(rideId)), headers: {
    'Authorization': 'Bearer $token',
  });
  print(response.statusCode);
  if(response.statusCode>=200&&response.statusCode<300){
    print(response.body);
    return true;}
  else{
    return false;
  }
}

