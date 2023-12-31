import 'package:flutter/material.dart';
import 'package:green_route_mobile/Screens/Carpool/CarPoolHomeScreen.dart';
import 'package:green_route_mobile/Screens/EV/EvScreen.dart';
import 'package:green_route_mobile/Screens/LoginScreen.dart';
import 'package:green_route_mobile/Screens/Transit/TransitHome.dart';
import 'package:green_route_mobile/Widgets/BottomDesign.dart';
import 'package:green_route_mobile/Widgets/MyCard.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),leading: Icon(Icons.home,color: Colors.white,), actions: [GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(Icons.power_settings_new),
        ),
      )],),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EvHomeScreen()));
                },
                child : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyCard("Ev Station", "Find the nearest EV-Stations near you", Icons.ev_station, Colors.blueAccent),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TransitHomeScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyCard("Transit", "Find the best bus routes for your destination", Icons.directions_transit, Colors.green),
                ),
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
        ],
      ),
    );
  }
}
