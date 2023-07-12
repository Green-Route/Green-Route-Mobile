import 'package:flutter/material.dart';
import 'package:green_route/Screens/Carpool/Rider/GetRides.dart';
import 'package:green_route/Screens/Carpool/Rider/MyRideDetail.dart';
import 'package:green_route/Screens/Carpool/Rider/PostRide.dart';
import 'package:green_route/Widgets/MyCard.dart';

import '../../../Widgets/BottomDesign.dart';
class GetMyRides extends StatefulWidget {
  const GetMyRides({Key? key}) : super(key: key);

  @override
  State<GetMyRides> createState() => _GetMyRidesState();
}

class _GetMyRidesState extends State<GetMyRides> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Rides'),),
      body: Stack(
        children: [
          LightDesign(),
          DarkDesign(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
              Expanded(
                child: ListView.builder(
                  itemCount: 100,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index){
                  return  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyRideDetail()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        height: 200,
                        child: const Column(
                          children: [
                            ListTile(
                              dense: true,
                              leading: Icon(Icons.location_on_outlined),
                              title: Text("From:"),
                            ),
                            ListTile(
                              dense: true,
                              leading: Icon(Icons.location_on),
                              title: Text("To:"),
                            ),

                            ListTile(
                              dense: true,
                              leading: Icon(Icons.calendar_month),
                              title: Text("Date:"),),

                            ListTile(
                              dense: true,
                              leading: Icon(Icons.alarm),
                              title: Text("Time:"),),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              )

            ],
          ),
          Logo(),
        ],
      ),
    );
  }
}
