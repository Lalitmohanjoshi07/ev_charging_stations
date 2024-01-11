import 'package:ev_charging_stations/activities/helper_classes/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth {

  //function to Login to the system
  static loginFirebase(
      String phone, String countryCode, BuildContext context) async {
    if (countryCode == "" || phone == "") {
      Helper.alert(context, "enter required values");
    } else if (phone.length < 10 || phone.contains(RegExp(r'.*\D.*'))) {
      Helper.alert(context, "enter valid phone number");
    } else {
      await FirebaseAuth.instance.verifyPhoneNumber(
        //phone number
        phoneNumber: countryCode+phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          Navigator.pushNamed(context, "otp",
                  arguments: phone.substring(6, 10));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      // Navigator.pushNamed(context, "otp",
      //     arguments: phone.substring(6, 10));
    }
  }
}
