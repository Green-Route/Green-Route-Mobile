import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_route/Controller/PassengerController.dart';
import 'package:green_route/Screens/Carpool/Passenger/GetRides.dart';
import 'package:green_route/Screens/LoginScreen.dart';

import '../../../Widgets/BottomDesign.dart';
import '../../../Widgets/CommonButton.dart';
import '../../../Widgets/CommonTextField.dart';



class SearchRide extends StatefulWidget {
  const SearchRide({Key? key}) : super(key: key);

  @override
  State<SearchRide> createState() => _SearchRideState();
}

class _SearchRideState extends State<SearchRide> {

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
  void initState() {
    // TODO: implement initState
    super.initState();
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
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => _selectDate(context),
                        child: Text(selectedDate.toString()=="null"?"Select Date":selectedDate.toString().substring(0,10)),
                      ),
                      SizedBox(height: 16.0),
                      ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonButton(s: "Post", bgcolor: Colors.teal, textColor: Colors.white, onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GetRides(from: selectedFromCity!, to: selectedToCity!, date: selectedDate!.year.toString()+"/"+selectedDate!.month.toString()+"/"+selectedDate!.day.toString())));


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
