import 'package:ev_charging_stations/activities/helper_classes/auth.dart';
import 'package:ev_charging_stations/activities/helper_classes/helper.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  // push to next page
  void verifiedOtp(bool check) {
    if (check) {
      Navigator.pushNamedAndRemoveUntil(context, "home", (route) => true);
    } else {
      Helper.alert(context, "wrong otp try rechecking the phone number");
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = (ModalRoute.of(context)!.settings.arguments == null)
        ? "no number"
        : ModalRoute.of(context)!.settings.arguments;
    TextEditingController otpController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Verify Otp",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "enter the otp sent to ******${text!}.",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              //TODO: add otp textarea
              Pinput(
                controller: otpController,
                length: 6,
                showCursor: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Helper.customButton("Continue", () async {
                bool res = await Auth.verifyOtp(otpController.text);
                verifiedOtp(res);
              }, 50, 300),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Edit phone number",
                    style: TextStyle(color: Colors.black),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
