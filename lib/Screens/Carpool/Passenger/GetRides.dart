
import 'package:flutter/material.dart';
import 'package:green_route/Controller/PassengerController.dart';
import 'package:green_route/Controller/RiderController.dart';
import 'package:green_route/Models/Carpool/PassengerGetRide.dart';
import 'package:green_route/Screens/Carpool/Rider/MyRideDetail.dart';
import '../../../Models/Carpool/PostedRide.dart';
import '../../../Widgets/BottomDesign.dart';

class GetRides extends StatefulWidget {
  final String from;
  final String to;
  final String date;
  const GetRides({Key? key, required this.from, required this.to, required this.date}) : super(key: key);

  @override
  State<GetRides> createState() => _GetRidesState();
}

class _GetRidesState extends State<GetRides> {
  bool isLoading = true;
  PassengerController _controller = PassengerController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getRides(from: widget.from, to: widget.to, date: widget.date).then((value) {
      if(_controller.response == null){
        setState(() {
          _controller.response!.data = [];
          isLoading = false;
        });
      }else{
        setState(() {
          isLoading =false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rides'),),
      body: Stack(
        children: [
          LightDesign(),
          DarkDesign(),
          (isLoading)?Center(child: CircularProgressIndicator()):Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
              Expanded(
                child: ( _controller.response!.data.length==0)?Center(child: Text("No Rides Available"),):ListView.builder(
                  itemCount: _controller.response!.data.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index){
                    Iterable<Datum> rides = _controller.response!.data.reversed;
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
                              title: Text("Time: "+rides.elementAt(index).time),),
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
