import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class DataModel extends ChangeNotifier {
  Map stationData = {'success': false, 'msg': 'getting data.....'};
  final Uri _url =
      Uri.https('mocki.io', '/v1/d86221e4-6755-4666-96ba-bf88b61a3cdc');

  Future getData() async {
    try {
      Response res = await get(_url);
      var data = jsonDecode(res.body) as List;
      if (res.statusCode == 200) {
        // if the success code is 200 means successful data retrival
        stationData['list'] = data;
        stationData['msg'] = 'data retrived';
        stationData['success'] = true;
        // print(data);
      }
    } catch (e) {
      stationData['msg'] = e.toString();
    }
    print(stationData);
    notifyListeners();
  }
}
