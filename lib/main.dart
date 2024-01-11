import 'package:ev_charging_stations/activities/home.dart';
import 'package:ev_charging_stations/activities/login.dart';
import 'package:ev_charging_stations/activities/otp_verif.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCJ7BAv7R2rUoFUMqqmTkzAsEu7lsaFzbo',
          appId: "1:61282129253:android:3962565b87ac087d477d8c",
          messagingSenderId: '61282129253',
          projectId: 'ev-charging-station-app-7db85'));

// Ideal time to initialize
//   await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

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
