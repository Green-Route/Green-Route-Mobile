import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_route/Screens/LoginScreen.dart';
import 'package:green_route/Screens/SignUpScreen.dart';

import '../Widgets/BottomDesign.dart';
import '../Widgets/CommonButton.dart';
import '../Widgets/CommonTextField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Register"),),
      body: Stack(
        children: [
          LightDesign(),
          DarkDesign(),

          ListView(
            children: [
              Container(height: MediaQuery.of(context).size.height*0.2
                ,),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonTextField("First Name", "First Name", _firstname),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonTextField("Last Name", "Last Name", _lastname),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonTextField("Mobile", "Mobile", _mobile),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonTextField("Email", "Email", _email),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonTextField("password", "password", _password),
                    ),

                    SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonButton(s: "Register", bgcolor: Colors.teal, textColor: Colors.white, onPressed: (){}),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(onTap:(){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },child: Container(
                        height:50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(text: const TextSpan(text: "Already have an account? ",style: TextStyle(color: Colors.grey,), children: [TextSpan(text: "Login Here",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal))])),
                        )) )
                  ],
                ),
              ),
              Container(height: MediaQuery.of(context).size.height*0.3,),

            ],
          ),
          Logo(),
        ],
      ),



    );
  }
}
