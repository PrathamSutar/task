import 'dart:convert';

import '../model/model.dart';
import 'package:http/http.dart' as http;


class apiservice{

    List<Albums> albumlist = [];



Future<List<Albums>> getapi() async {
    var resp = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    var data = jsonDecode(resp.body.toString());

    if (resp.statusCode == 200) {
      for (Map<String, dynamic> ids in data) {
        albumlist.add(Albums.fromJson(ids));
      }
      return albumlist;
    } else {
      return albumlist;
    }



}

}