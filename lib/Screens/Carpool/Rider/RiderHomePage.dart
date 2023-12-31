import 'package:flutter/material.dart';
import 'package:green_route_mobile/Screens/Carpool/Rider/GetRides.dart';
import 'package:green_route_mobile/Screens/Carpool/Rider/PostRide.dart';
import 'package:green_route_mobile/Widgets/MyCard.dart';

import '../../../Widgets/BottomDesign.dart';
class RiderHome extends StatefulWidget {
  const RiderHome({Key? key}) : super(key: key);

  @override
  State<RiderHome> createState() => _RiderHomeState();
}

class _RiderHomeState extends State<RiderHome> {
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PostRide()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyCard("Post A Ride", "Have a car ?, post a ride and share it with others", Icons.post_add, Colors.red),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GetMyRides()));
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
