import 'package:flutter/material.dart';
import 'package:flutter_task/My_Screens/Homescreen.dart';
import 'package:flutter_task/My_Screens/Loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final savedemail= prefs.getString("emaildata");
  print(savedemail);



  runApp(MyApp(savedemail: savedemail,));
}

class MyApp extends StatelessWidget {
final savedemail;
  

   MyApp({super.key, this.savedemail, });

   
  
  

  @override
  Widget build(BuildContext context) {

    print("hi $savedemail");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: savedemail!=null ?Homescreen() :  Loginscreen(),
    );
  }
}