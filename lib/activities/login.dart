import 'package:ev_charging_stations/activities/helper_classes/auth.dart';
import 'package:ev_charging_stations/activities/helper_classes/helper.dart';
import 'package:flutter/material.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({super.key});

  @override
  State<LoginActivity> createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phNoCon = TextEditingController();

  @override
  void initState() {
    setState(() {
      countryCodeController.text = "+91";
    });
    super.initState();
  }

  //function when the login is processed
  void onLogin(Map res) {
    if (!res['success']) {
      Helper.alert(context, "enter valid phone number");
    } else {
      Navigator.pushNamed(context, "otp",
          arguments: phNoCon.text.toString().substring(6, 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(children: [
              const Row(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "we'll send you a code it will keep your account safe",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Helper.customPhoneEditor(countryCodeController, phNoCon),
              const SizedBox(
                height: 30,
              ),
              Helper.customButton("Send Code", () async {
                Map res = await Auth.loginFirebase(phNoCon.text.toString(),
                    countryCodeController.text.toString());
                onLogin(res);
              }, 50, 300)
            ]),
          ),
        ),
      ),
    );
  }
}
