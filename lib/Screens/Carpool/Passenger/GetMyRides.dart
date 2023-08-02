
import 'package:flutter/material.dart';
import 'package:green_route_mobile/Controller/PassengerController.dart';
import 'package:green_route_mobile/Controller/RiderController.dart';
import 'package:green_route_mobile/Screens/Carpool/Rider/MyRideDetail.dart';
import '../../../Models/Carpool/PostedRide.dart';
import '../../../Widgets/BottomDesign.dart';

class GetPassengerMyRides extends StatefulWidget {
  const GetPassengerMyRides({Key? key}) : super(key: key);

  @override
  State<GetPassengerMyRides> createState() => _GetPassengerMyRidesState();
}

class _GetPassengerMyRidesState extends State<GetPassengerMyRides> {
 PassengerController _con = new PassengerController();
 bool loading = true;
 bool nullresponse = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.passengerGetMyRides().then((value) {
      setState(() {
        if(_con.passengerMyRides != null){
        loading = false;
        }
        else{
          loading = false;
          nullresponse = true;
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
          (loading)?Center(child: CircularProgressIndicator()):(nullresponse)?Center(child: Text("Try again Later"),): Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
              Expanded(
                child:
                ListView.builder(
                    itemCount: _con.passengerMyRides!.rides.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index){

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
                                  title: Text("From: "+ _con.passengerMyRides!.rides.elementAt(index).from),
                                ),
                                ListTile(
                                  dense: true,
                                  leading: Icon(Icons.location_on),
                                  title: Text("To: "+ _con.passengerMyRides!.rides.elementAt(index).to),
                                ),
                                ListTile(
                                  dense: true,
                                  leading: Icon(Icons.calendar_month),
                                  title: Text("Date: "+ _con.passengerMyRides!.rides.elementAt(index).date),),
                                ListTile(
                                    dense: true,
                                    leading: Icon(Icons.alarm),
                                    title: Text("Time: "+_con.passengerMyRides!.rides.elementAt(index).date),
                                    trailing: ElevatedButton(onPressed: (){
                                      _con.cancelPassengerRide(context, _con.passengerMyRides!.rides.elementAt(index).id).then((value) {
                                        setState(() {
                                          loading = true;
                                        });
                                        if(value){
                                          setState(() {
                                            loading = false;
                                            _con.passengerGetMyRides().then((value) {
                                              setState(() {
                                                if(_con.passengerMyRides != null){
                                                  loading = false;
                                                }
                                                else{
                                                  loading = false;
                                                  nullresponse = true;
                                                }
                                              });
                                            });
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successful"),backgroundColor: Colors.green,));

                                          });
                                        }
                                        else{
                                          setState(() {
                                            loading = false;
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Unsuccessful ... Try again later"),backgroundColor: Colors.red,));
                                          });
                                        }
                                      });
                                    }, child: Text("Cancel"))),
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
