import 'package:green_route/Repo/APIs/passengerAPI.dart';

import '../Models/Carpool/PassengerGetRide.dart';


class PassengerController{

 late  PassengerGetRides? response;
  Future getRides({required String from, required String to, required String date}) async{
    response = await passengerGetRides(from: from, to: to, date: date);
    print(response);
  }
}