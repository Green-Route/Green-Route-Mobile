

import 'package:flutter/material.dart';
import 'package:green_route_mobile/Models/Carpool/PostedRide.dart';
import 'package:green_route_mobile/Repo/APIs/riderAPI.dart';

class RiderController{
  late PostedRide postedRide;
   Future postRide(BuildContext context, {
    required String from,
  required String to,
  required String date,
  required String time,

  required String price,
  required String seat}) async{
    var response = await riderPostRide(context,from: from,to: to,date:date,time:time,price: price, seat: seat);
    print(response);
    if(response!=null){
      return true;
    }
return false;
  }

  Future getRiderRides(BuildContext context) async{
    PostedRide? response = await riderPostedRide();
    if(response!=null){

      return response;
    }
    return null;
  }
  Future<bool> deleteRiderRide(BuildContext context, String RideID) async{
    bool response = await deleteRiderRideAPI(RideID);
    return response;
  }
}