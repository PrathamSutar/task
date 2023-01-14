import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_task/utils/textfildwidget.dart';
import './Homescreen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({
    super.key,
  });
  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcntr = TextEditingController();
    TextEditingController passwordcntr = TextEditingController();

    Future<void> savedata(String key, String value) async {
      SharedPreferences _pref = await SharedPreferences.getInstance();

      await _pref.setString(key, value);
    }

    void saveuserdetail() async {
      await savedata("Email", emailcntr.text);
      await savedata("Password", passwordcntr.text);
      print("data saved");
    }

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
            textfiled(
              controller: emailcntr,
              obsecuretext: false,
              title: "Email",
            ),
            SizedBox(
              height: 10,
            ),
            textfiled(
              controller: passwordcntr,
              title: "Password",
              obsecuretext: true,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                saveuserdetail();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homescreen(),
                    ));
              },
              child: Text("LogIn"),
            )
          ],
        ),
      ),
    );
  }

  // Widget customtextfiled(
  //     String title, TextEditingController controller, bool obsecuretext) {
  //   return Padding(
  //     padding: EdgeInsets.all(15),
  //     child: TextField(
  //       controller: controller,
  //       obscureText: obsecuretext,
  //       decoration:
  //           InputDecoration(border: OutlineInputBorder(), hintText: title),
  //     ),
  //   );
  // }
}
