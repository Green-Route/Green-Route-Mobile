import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData Icondata;
  final Color Iconcolor;
  //final FormFieldValidator<String> validator;

  MyCard(
      this.title,
      this.subtitle,
      this.Icondata,
      this.Iconcolor
     );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 0.5,spreadRadius: 0.5,  offset: Offset(1.5, 1.5))],

      ),
      height: 150,
      child: Center(
        child: ListTile(
          leading: Icon(Icondata, color: Iconcolor,size: 50,),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}