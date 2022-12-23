import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_task/My_Screens/Homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcntr = TextEditingController();
    TextEditingController passwordcntr = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Image.asset("assets/images/login.png"),
            SizedBox(
              height: 10,
            ),
            Text(
              "Welcome User",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailcntr,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        label: Text("Enter Email")),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  TextFormField(
                    controller: passwordcntr,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent)),
                        hintText: "Password",
                        label: Text("Enter Password")),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(onPressed: () async {

                    SharedPreferences pref = await SharedPreferences.getInstance();
                    pref.setString("email", emailcntr.text);

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return
                      Homescreen();
                    },));
                  }, child: Text("Log In"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
