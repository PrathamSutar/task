import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_task/apicall/filter.dart';
import 'package:flutter_task/apicall/services.dart';
import 'package:flutter_task/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController searchc = TextEditingController();
  bool isloading = true;
  bool swich = false;
  ThemeData dark = ThemeData(brightness: Brightness.dark);
  ThemeData light = ThemeData(brightness: Brightness.light);

  List<dynamic> albumlist = [];


  @override
  void initState() {
    

    getapi();

    super.initState();
  }


  getapi() async {
    albumlist = (await apiservice().getapi());
    if (albumlist != null) {
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: swich ? dark : light,
      home: Scaffold(
        appBar: AppBar(
          title: Text("user name"),
          actions: [
            Switch(
              value: swich,
              onChanged: (newvalue) {
                setState(() {
                  swich = newvalue;
                });
              },
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                controller: searchc,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "search",
                  prefixIcon: Icon(Icons.search_outlined),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: albumlist.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Card(
                              child:
                                  Image.network(albumlist[index].url.toString(),fit: BoxFit.fill,)),
                        ),
                        Text(albumlist[index].title.toString())
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
