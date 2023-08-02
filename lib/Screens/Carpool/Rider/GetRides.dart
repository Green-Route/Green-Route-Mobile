
import 'package:flutter/material.dart';
import 'package:green_route_mobile/Controller/RiderController.dart';
import 'package:green_route_mobile/Screens/Carpool/Rider/MyRideDetail.dart';
import '../../../Models/Carpool/PostedRide.dart';
import '../../../Widgets/BottomDesign.dart';

class GetMyRides extends StatefulWidget {
  const GetMyRides({Key? key}) : super(key: key);

  @override
  State<GetMyRides> createState() => _GetMyRidesState();
}

class _GetMyRidesState extends State<GetMyRides> {
  bool isLoading = true;
  RiderController _con = RiderController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getRiderRides(context).then((value) {
      setState(() {
        if(value!=null){
        _con.postedRide=value;
        isLoading = false;
        }
        else{
          _con.postedRide.rides=[];
          isLoading = false;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Rides'),),
      body: Stack(
        children: [
          LightDesign(),
          DarkDesign(),
          (isLoading)?Center(child: CircularProgressIndicator()):Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
              Expanded(
                child: (_con.postedRide.rides.length==0)?Center(child: Text("No Posted Rides"),):
                ListView.builder(
                  itemCount: _con.postedRide.rides.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index){
                    Iterable<Ride> rides = _con.postedRide.rides.reversed;
                  return  GestureDetector(
                    onTap: (){
                        },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        height: 200,
                        child: Column(
                          children: [
                            ListTile(
                              dense: true,
                              leading: Icon(Icons.location_on_outlined),
                              title: Text("From: "+rides.elementAt(index).from),
                            ),
                            ListTile(
                              dense: true,
                              leading: Icon(Icons.location_on),
                              title: Text("To: "+rides.elementAt(index).to),
                            ),
                            ListTile(
                              dense: true,
                              leading: Icon(Icons.calendar_month),
                              title: Text("Date: "+rides.elementAt(index).date),),
                            ListTile(
                              dense: true,
                              leading: Icon(Icons.alarm),
                              title: Text("Time: "+rides.elementAt(index).time),
                            trailing: ElevatedButton(onPressed: (){
                              _con.deleteRiderRide(context, rides.elementAt(index).id).then((value) {
                                setState(() {
                                  isLoading = true;
                                });
                                if(value){
                                  setState(() {
                                    isLoading = false;
                                    _con.getRiderRides(context).then((value) {
                                      setState(() {
                                        if(value!=null){
                                          _con.postedRide=value;
                                          isLoading = false;
                                        }
                                        else{
                                          _con.postedRide.rides=[];
                                          isLoading = false;
                                        }
                                      });
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successful"),backgroundColor: Colors.green,));

                                  });
                                }
                                else{
                                  setState(() {
                                    isLoading = false;
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Unsuccessful ... Try again later"),backgroundColor: Colors.red,));
                                  });
                                }
                              });
                            }, child: Text("Delete"))),
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
