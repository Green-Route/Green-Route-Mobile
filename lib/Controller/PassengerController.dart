

import 'package:flutter/material.dart';
import 'package:green_route_mobile/Models/Carpool/GetPassengerMyRides.dart';
import 'package:green_route_mobile/Repo/APIs/passengerAPI.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Carpool/PassengerGetRide.dart';


class PassengerController{

 late  PassengerGetRides? response;
 late  GetPassengerMyRides? passengerMyRides;
 late var userId;

  Future getRides({required String from, required String to, required String date}) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.get("userId");
    response = await passengerGetRides(from: from, to: to, date: date);
    print(response);
  }
 Future passengerGetMyRides() async{
   passengerMyRides = await pGetMyRides();
 }
  Future passengerBookRides(String rideId) async{

    bool response = await bookRide(rideId);
    return response;
  }
 Future<bool> cancelPassengerRide(BuildContext context, String RideID) async{
   bool response = await cancelPassengerRideAPI(RideID);
   return response;
 }
}