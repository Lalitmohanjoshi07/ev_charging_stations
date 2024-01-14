import 'package:ev_charging_stations/helper_classes/data_model.dart';
import 'package:ev_charging_stations/helper_classes/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    await context.read<DataModel>().getData();
  }

  //meathod to create a rough data
  dynamic theScript() {
    return !context.read<DataModel>().stationData['success']
        ? Text(context.read<DataModel>().stationData['msg'])
        : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 25),
              child: Text(
                "Nearby Chargers (${context.read<DataModel>().stationData['list'].length})",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            for (var e in context.read<DataModel>().stationData['list'])
              //TODO: pass the values fetched from API
              Helper.customTile(() {
                Navigator.pushNamed(context, 'profile');
              },
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
    return Consumer<DataModel>(builder: (context, value, child) {
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
    });
  }
}
