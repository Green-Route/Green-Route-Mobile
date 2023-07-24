import 'package:flutter/material.dart';
import 'package:green_route/Screens/Carpool/Passenger/SearchRide.dart';
import 'package:green_route/Screens/Carpool/Rider/GetRides.dart';
import 'package:green_route/Screens/Carpool/Rider/PostRide.dart';
import 'package:green_route/Widgets/MyCard.dart';

import '../../../Widgets/BottomDesign.dart';
class PassengerHome extends StatefulWidget {
  const PassengerHome({Key? key}) : super(key: key);

  @override
  State<PassengerHome> createState() => _PassengerHomeState();
}

class _PassengerHomeState extends State<PassengerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Green Route'),),
      body: Stack(
        children: [
          LightDesign(),
          DarkDesign(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Logo(),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchRide()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyCard("Book A Ride", "Want to travel? Book a ride", Icons.post_add, Colors.red),
                ),
              ),
              GestureDetector(
                onTap: (){
                  },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyCard("Get My Rides", "View your rides", Icons.notification_add, Colors.blue),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
