import 'package:ev_charging_stations/helper_classes/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
  //verification id
  static String verifyId = "";
  User? user;

  void addUser() {
    user = FirebaseAuth.instance.currentUser;
    print(user?.uid.toString());
    notifyListeners();
  }

  //function to Login to the system
  static Future loginFirebase(
      String phone, String countryCode, BuildContext context) async {
    if (countryCode == "" || phone == "") {
      Helper.alert(context, 'enter valid values');
    } else if (phone.length < 10 || phone.contains(RegExp(r'.*\D.*'))) {
      Helper.alert(context, "enter valid phone");
    } else {
      try {
        await FirebaseAuth.instance.verifyPhoneNumber(
          //phone number
          phoneNumber: countryCode + phone,
          verificationCompleted: (PhoneAuthCredential credential) {},
          //once the code is sent
          verificationFailed: (FirebaseAuthException e) {
            Helper.alert(context, e.code);
          },
          codeSent: (String verificationId, int? resendToken) {
            //stored verification id here in verify id
            verifyId = verificationId;
            Navigator.pushNamed(context, "otp",
                arguments: phone.substring(6, 10));
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
        return false;
      } catch (e) {
        return true;
      }
    }
    return false;
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
