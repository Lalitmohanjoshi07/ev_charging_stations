import 'package:ev_charging_stations/helper_classes/data_model.dart';
import 'package:ev_charging_stations/helper_classes/helper.dart';
import 'package:flutter/material.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  Map data = {'success': false, 'msg': "no data"};
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    await DataModel.getData();
    setState(() {
      data = DataModel.stationData;
    });
  }

  dynamic theScript() {
    return !data['success']
        ? Text(data['msg'])
        : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 25),
              child: Text(
                "Nearby Chargers (${data['list'].length})",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            //TODO: pass the values fetched from API
            for (var e in data['list'])
              Helper.customTile(() {},
                  id: e['uid'],
                  title: e['evse_name'],
                  power:
                      "${(e['connectors'][0]['max_voltage'] / 1000).toString()}KW",
                  status: (e['status']).toUpperCase()),
          ]);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    // TODO: fetch the data
    int chargers = 20;
    return Scaffold(
        appBar: AppBar(
            title: Container(
          // Add padding around the search bar
          padding: const EdgeInsets.all(8.0),
          // Use a Material design search bar
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              // Add a clear button to the search bar
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onPressed: () => searchController.clear(),
              ),
              // Add a search icon or button to the search bar
              prefixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Perform the search here
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        )),
        body: SingleChildScrollView(
          child: theScript(),
        ));
  }
}
