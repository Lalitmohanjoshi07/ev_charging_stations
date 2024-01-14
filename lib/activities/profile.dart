import 'package:ev_charging_stations/helper_classes/helper.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Help",
                  )),
            )
          ],
          title: const Text("title"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                //update the assets with network and image path with your image URL
                child: Image.asset(
                  "images/station.jpg",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Icon(Icons.ev_station),
                  //id of station
                  Text("ID")
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "title",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on),
                  Expanded(
                    child: Text("location"),
                  )
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.watch_later),
                  Text("open "),
                  Icon(
                    Icons.fiber_manual_record,
                    size: 10,
                  ),
                  Text(" 24hrs"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.keyboard),
                      const Text("type 2 "),
                      const Icon(
                        Icons.fiber_manual_record,
                        size: 10,
                      ),
                      const Text(" 100 KW"),
                      const SizedBox(
                        width: 15,
                      ),
                      Helper.customPill("status", Colors.yellow),
                    ],
                  ),
                  const Row(
                    children: [Icon(Icons.star_rounded), Text("4.5 (20)")],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //price for charging
              const Text("\$4.50/kW"),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.navigation_rounded),
                        Text("Navigate")
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [Icon(Icons.share_outlined), Text("Share")],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              const Text("About"),
              const SizedBox(
                height: 20,
              ),
              const Text(
                  "Use this rich text editor to write and format your content. The resulting HTML will be displayed in the second box below."),
              const SizedBox(
                height: 30,
              ),
            ]),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Helper.customButton("Charge here", () {}, 50, 310)],
        ));
  }
}
