import 'package:flutter/material.dart';

class Helper {
  //a custom designed station viewer for home activity require some values
  static customTile(
    VoidCallback callback, {
    title = "Title",
    id = "ID",
    location = "location",
    type = "Type",
    power = "Power",
    status = "Status",
    image = "images/station.jpg",
  }) {
    //color map for the status
    Map availableColors = {
      'AVAILABLE': Colors.lightGreen,
      "CHARGING": Colors.yellow,
      "UNAVAILABLE": Colors.orange.shade400,
      "UNKNOWN": Colors.deepOrange
    };
    Color statusColor = availableColors[status] != null
        ? availableColors[status]
        : Colors.blueAccent;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)]),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              shadowColor: Colors.black,
              elevation: 0,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
          // TODO: update on pressed
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  //update the assets with network and image path with your image URL
                  child: Image.asset(
                    image,
                    height: 80,
                    width: 80,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //id
                      Text(
                        id,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      //title
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                      //location
                      Text(
                        location,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(children: <Widget>[
                            Text(
                              type,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.black),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                              width: 3,
                              height: 3,
                            ),
                            Text(
                              power,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black),
                            ),
                          ]),
                          // Expanded(
                          //     child: Container(
                          //   width: double.infinity,
                          // )),
                          Helper.customPill(status, statusColor)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  //custom pill
  static customPill(String name, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Text(
        name,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
      ),
    );
  }

  //its a custom phone editor designed
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
