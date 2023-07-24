import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:green_route/Models/LoginModel.dart';
import 'package:green_route/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


Future<Login?> userLogin(BuildContext context, String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var response = await http.post(Uri.parse(base_url+login), body: {
    'email': email,
    'password': password
  });
  print(response.statusCode);
  if(response.statusCode>=200&&response.statusCode<300){
    print(response.body);
  return Login.fromJson(jsonDecode(response.body));}
  else{
    return null;
  }
}

Future? userRegister(BuildContext context, {required String firstName,
    required String lastName,
    required String mobile,
    required String email,
    required String password,}
    ) async {

  var response = await http.post(Uri.parse(base_url+register), body: {
    'firstName':firstName,
    'lastName':lastName,
    'mobile':mobile,
    'email':email,
    'password':password

  });
  print(response.body);
  if(response.statusCode>=200&&response.statusCode<300){

    return response.statusCode.toString();
  }
  else{
    return null;
  }
}