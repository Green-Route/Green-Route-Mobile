import 'package:flutter/material.dart';
import 'package:green_route/Screens/Carpool/CarPoolHomeScreen.dart';
import 'package:green_route/Widgets/MyCard.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Green Route'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyCard("Ev Station", "Find the nearest EV-Stations near you", Icons.ev_station, Colors.blueAccent),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyCard("Transit", "Find the best bus routes for your destination", Icons.directions_transit, Colors.green),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CarPoolHome()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyCard("CarPool", "Share ride with people", Icons.car_rental, Colors.red),
            ),
          ),

        ],
      ),
    );
  }
}
