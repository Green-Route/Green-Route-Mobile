import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_route_mobile/Screens/HomeScreen.dart';
import 'package:green_route_mobile/Screens/SignUpScreen.dart';
import 'package:green_route_mobile/Widgets/BottomDesign.dart';
import 'package:green_route_mobile/Widgets/CommonButton.dart';

import '../Controller/AuthController.dart';
import '../Widgets/CommonTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  AuthController _con = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Login"),),
      body: Stack(
        children: [
          LightDesign(),
          DarkDesign(),
          Logo(),
          Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonTextField("Email", "Email", _email),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonTextField("password", "password", _password, obscure: true,),
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonButton(s: "Login", bgcolor: Colors.teal, textColor: Colors.white, onPressed: (){
                  _con.login(context, _email.text, _password.text);
                }),
              ),
              SizedBox(height: 10,),
              Text("Forgot Password?"),
              SizedBox(height: 20,),
              GestureDetector(onTap:(){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignUpScreen()));
              },child: Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(text: const TextSpan(text: "New User? ",style: TextStyle(color: Colors.grey,), children: [TextSpan(text: "Register Here",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal))])),
                ),
              ) )
            ],
          ),),
        ],
      ),
    );
  }
}
