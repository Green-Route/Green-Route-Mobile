
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getUserId() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var response = preferences.get("userId");
  return response.toString();

}
Future<String> getToken() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var response = preferences.get("token");
  return response.toString();

}