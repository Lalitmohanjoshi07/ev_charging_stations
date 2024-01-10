import 'package:ev_charging_stations/activities/home.dart';
import 'package:ev_charging_stations/activities/login.dart';
import 'package:ev_charging_stations/activities/otp_verif.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => const LoginActivity(),
      'home': (context) => const HomeActivity(),
      'otp': (context) => const OtpVerification()
    },
  ));
}
