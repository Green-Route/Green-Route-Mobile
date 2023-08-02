import 'package:flutter/material.dart';
import 'package:green_route_mobile/Widgets/BottomDesign.dart';
class MyRideDetail extends StatefulWidget {
  const MyRideDetail({Key? key}) : super(key: key);

  @override
  State<MyRideDetail> createState() => _MyRideDetailState();
}

class _MyRideDetailState extends State<MyRideDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Ride Detail"),),
      body: Stack(

        children: [
        LightDesign(),
          DarkDesign(),
          Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child:const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("edit"),
                          )),
                      const SizedBox(width: 10,),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("delete"),
                          )),
                      const SizedBox(width: 10,),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),

                  child:  Column(
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
                      ListTile(
                        dense: true,
                        leading: Icon(Icons.attach_money),
                        title: Text("Price:"),),
                      ListTile(
                        dense: true,
                        leading: Icon(Icons.event_seat),
                        title: Text("Seats:"),),


                    ],
                  ),
                ),
              Divider(
                height: 10,
                color: Colors.black,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount:5,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return ListTile(
                        leading: CircleAvatar(),
                        title: Text("Name:"),
                        subtitle: Text("Phone:"),
                      );
                    }),
              )
            ],
          ),

        ],
      ),
    );
  }
}
