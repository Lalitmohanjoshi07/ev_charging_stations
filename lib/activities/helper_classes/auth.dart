import 'dart:js';

import 'package:ev_charging_stations/activities/helper_classes/helper.dart';
import 'package:ev_charging_stations/activities/otp_verif.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  //verification id
  static String verifyId = "";

  //function to Login to the system
  static loginFirebase(String phone, String countryCode) async {
    if (countryCode == "" || phone == "") {
      return {"success": false, "msg": "enter valid values"};
    } else if (phone.length < 10 || phone.contains(RegExp(r'.*\D.*'))) {
      return {"success": false, "msg": "enter valid values"};
    } else {
      Map res = {
        'success': false,
      };
      try {
        await FirebaseAuth.instance.verifyPhoneNumber(
          //phone number
          phoneNumber: countryCode + phone,
          verificationCompleted: (PhoneAuthCredential credential) {},
          //once the code is sent
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationId, int? resendToken) {
            //stored verification id here in verify id
            verifyId = verificationId;
            // update the map
            res['success'] = true;
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } catch (e) {
        res['success'] = false;
        res['msg'] = "some internal error";
      }
      return res;
    }
  }

  //function to verify otp
  static verifyOtp(String code) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verifyId, smsCode: code);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      return false;
    }
  }

  static otpVerifyHelper(String code) async {}
}
