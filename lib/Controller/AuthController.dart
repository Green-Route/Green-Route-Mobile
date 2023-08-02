import 'package:flutter/material.dart';
import 'package:green_route_mobile/Models/LoginModel.dart';
import 'package:green_route_mobile/Repo/APIs/authenticationAPI.dart';
import 'package:green_route_mobile/Screens/HomeScreen.dart';
import 'package:green_route_mobile/Screens/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{

  Future login(BuildContext context,String email, String password) async{
    Login? response = await userLogin(context, email, password);
    if(response!=null){
      SharedPreferences prefs= await SharedPreferences.getInstance();
      prefs.setString("token", response.token);
      prefs.setString("userId", response.user.id);
      print(response.user);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    }

  }
  Future register(BuildContext context, {required String firstName,
      required String lastName,
      required String mobile,
      required String email,
      required String password}) async{
    var response = await userRegister(context,firstName: firstName,lastName: lastName,mobile: mobile,password: password,email: email);
    print(response);
    if(response!=null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }

  }
}