import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_route/Screens/LoginScreen.dart';

import '../../../Widgets/CommonButton.dart';
import '../../../Widgets/CommonTextField.dart';



class PostRide extends StatefulWidget {
  const PostRide({Key? key}) : super(key: key);

  @override
  State<PostRide> createState() => _PostRideState();
}

class _PostRideState extends State<PostRide> {
  String? selectedFromCity;
  TextEditingController _seats = TextEditingController();
  TextEditingController _price = TextEditingController();
  String? selectedToCity;
  String? selectedProvince;
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
      body: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              onChanged: (String? newValue){
                setState(() {
                  selectedProvince = newValue!;
                });
              },
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
          GestureDetector(
            onTap: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Alert'),
                    content: Text('This is an alert dialog.'),
                   
                  );
                },
              );

            },
            child : Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonButton(s: "Post", bgcolor: Colors.teal, textColor: Colors.white, onPressed: (){}),
            ),
          ),
          SizedBox(height: 20,),

        ],
      ),),



    );
  }
}
