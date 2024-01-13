import 'dart:convert';
import 'package:http/http.dart';

class DataModel {
  static Map stationData = {'success': false, 'msg': 'getting data.....'};
  static Uri url =
      Uri.https('mocki.io', '/v1/d86221e4-6755-4666-96ba-bf88b61a3cdc');
  static Future getData() async {
    try {
      Response res = await get(url);
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
    // print(stationData);
  }
}
