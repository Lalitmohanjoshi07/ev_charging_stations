import 'package:ev_charging_stations/helper_classes/auth.dart';
import 'package:ev_charging_stations/helper_classes/helper.dart';
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

  //alert if any error comes
  void alertWanted(bool ch) {
    if (ch) {
      Helper.alert(context, "some internal error");
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
                bool ch = await Auth.loginFirebase(phNoCon.text.toString(),
                    countryCodeController.text.toString(), context);
                alertWanted(ch);
              }, 50, 300)
            ]),
          ),
        ),
      ),
    );
  }
}
