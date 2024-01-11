import 'package:flutter/material.dart';

class Helper {
  static customPhoneEditor(TextEditingController countryCodeController,
      TextEditingController phoneController) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 100,
          child: Column(
            children: <Widget>[
              const Text(
                "Country code",
                style: TextStyle(fontSize: 10),
              ),
              TextField(
                controller: countryCodeController,
                keyboardType: TextInputType.phone,
                maxLength: 4,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              const Text(
                "Phone Number",
                style: TextStyle(fontSize: 10),
              ),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                style: const TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    counterText: ""),
              ),
            ],
          ),
        )
      ],
    );
  }

  //atertbox
  static dynamic alert(BuildContext context, String text) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("ok"))
            ],
          );
        });
  }

  //custom button call it when needed
  static dynamic customButton(
      String name, VoidCallback callback, double height, double width) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          onPressed: () {
            callback();
          },
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )),
    );
  }

  //custom text editor
  static dynamic customTextEditor(TextEditingController controller,
      String hintText, IconData iconData, bool hide) {
    return TextField(
      controller: controller,
      obscureText: hide,
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
    );
  }
}
