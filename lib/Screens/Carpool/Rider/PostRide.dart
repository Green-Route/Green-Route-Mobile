import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_route_mobile/Controller/RiderController.dart';
import 'package:green_route_mobile/Screens/LoginScreen.dart';

import '../../../Widgets/BottomDesign.dart';
import '../../../Widgets/CommonButton.dart';
import '../../../Widgets/CommonTextField.dart';



class PostRide extends StatefulWidget {
  const PostRide({Key? key}) : super(key: key);

  @override
  State<PostRide> createState() => _PostRideState();
}

class _PostRideState extends State<PostRide> {
  RiderController _con = RiderController();
  String? selectedFromCity;
  TextEditingController _seats = TextEditingController();
  TextEditingController _price = TextEditingController();
  String? selectedToCity;
  String selectedProvince = "Ontario";
  List<String> cities = [
    "Windsor",
    "Toronto",
    "London",
    "Kitchener",
    "Guelph",
    "Leamington",
    "Cambridge",
    "Scarborough",
    "Markham",
    "Mississauga"
  ];

  List<String> provinces = [
  "Alberta",
  "British Columbia",
  "Manitoba",
  "New Brunswick",
  "Newfoundland and Labrador",
  "Northwest Territories",
  "Nova Scotia",
  "Nunavut",
  "Ontario",
  "Prince Edward Island",
  "Quebec",
  "Saskatchewan",
  "Yukon",
  ];
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Green Route'),),
      body: Stack(
        children: [
          LightDesign(),
          DarkDesign(),
          SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(height: MediaQuery.of(context).size.height*0.15,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select Province',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedProvince,
                  items: provinces.map((String province) {
                    return DropdownMenuItem<String>(
                      value: province,
                      child: Text(province),
                    );
                  }).toList(),
                  onChanged: null,
                ),
              ),


              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'From',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedFromCity,
                  items: cities.map((String city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (String? newValue){
                    setState(() {
                      selectedFromCity = newValue!;
                    });
                  },
                ),
              ),


              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'To',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedToCity,
                  items: cities.map((String city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (String? newValue){
                    setState(() {
                      selectedToCity = newValue!;
                    });
                  },
                ),
              ),
          Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonTextField("Seats", "Seats", _seats,textInputType: TextInputType.number,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonTextField("Price", "Price", _price,textInputType: TextInputType.number),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => _selectDate(context),
                        child: Text(selectedDate.toString()=="null"?"Select Date":selectedDate.toString().substring(0,10)),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () => _selectTime(context),
                        child: Text(selectedTime.toString()=="null"?"Select Time":"${selectedTime!.hour.toString()}:${selectedTime!.minute.toString()}"),
                      ),]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonButton(s: "Post", bgcolor: Colors.teal, textColor: Colors.white, onPressed: (){
                  print(selectedFromCity);
                  print(selectedToCity);
                  print(_seats.text);
                  print(_price.text);
                  print(selectedDate!.year.toString()+"/"+selectedDate!.month.toString()+"/"+selectedDate!.day.toString());
                  print(selectedTime!.hour.toString()+":"+selectedTime!.minute.toString());

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Alert'),
                        content: Text('Are you sure you want to post the Ride?'),
                        actions: [
                          ElevatedButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          ElevatedButton(
                            child: Text('OK'),
                            onPressed: () {
                              // Perform the desired action here
                              _con.postRide(context,
                                  from: selectedFromCity!,
                                  to: selectedToCity!,
                                  date: selectedDate!.year.toString()+"/"+selectedDate!.month.toString()+"/"+selectedDate!.day.toString(),
                                  time: selectedTime!.hour.toString()+":"+selectedTime!.minute.toString(),
                                  price: _price.text,
                                  seat: _seats.text)!.then((value) {
                                    if(value){
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Posted Successfully"),backgroundColor: Colors.green,));

                                    }
                                    else{
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong... try again later"),backgroundColor: Colors.red,));
                                    }
                              });
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
              ),
              SizedBox(height: 20,),
              Container(height: MediaQuery.of(context).size.height*0.3,),
            ],
          ),),
          Logo(),
        ],
      ),



    );
  }
}
