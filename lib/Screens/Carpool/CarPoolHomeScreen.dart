import 'package:flutter/material.dart';
import 'package:green_route/Screens/Carpool/Rider/RiderHomePage.dart';
import 'package:green_route/Widgets/MyCard.dart';
class CarPoolHome extends StatefulWidget {
  const CarPoolHome({Key? key}) : super(key: key);

  @override
  State<CarPoolHome> createState() => _CarPoolHomeState();
}

class _CarPoolHomeState extends State<CarPoolHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Green Route'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RiderHome()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyCard("Rider", "Are you a rider wanting to post a ride?", Icons.person, Colors.red),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyCard("Passenger", "Find amazing rides for your destination", Icons.car_rental, Colors.blue),
          ),

        ],
      ),
    );
  }
}
