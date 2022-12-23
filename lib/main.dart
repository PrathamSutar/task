import 'package:flutter/material.dart';
import 'package:flutter_task/My_Screens/Homescreen.dart';
import 'package:flutter_task/My_Screens/Loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
          SharedPreferences pref = await SharedPreferences.getInstance();
         var email = pref.getString("email");


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:
      
       ThemeData(
        
        primarySwatch: Colors.deepPurple,
      ),
      home:  Loginscreen(),
    );
  }
}




