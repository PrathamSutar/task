import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_task/My_Screens/Homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController emailcntr = TextEditingController();
    TextEditingController passwordcntr = TextEditingController();
String? email;
String? password;

    cheklogin() async {

      if(emailcntr.text==email && passwordcntr.text==password){

        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("email", emailcntr.text);
      }
    }





    return Scaffold(

      body: SingleChildScrollView(padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Image.asset("assets/images/login.png"),

            SizedBox(
              height: 10,

            ),
            Text("Welcome User",style: TextStyle(fontSize: 30),),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding:EdgeInsets.symmetric(vertical: 10,horizontal: 10) ,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailcntr,
                    
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                    label: Text("Enter Email")

                  ),
            
            
                  ),
            
                  SizedBox(
                    height: 45,
                  ),
            
                  TextFormField(
                    controller: passwordcntr,
                    
                    decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                    hintText: "Password",
                    label: Text("Enter Password")

                  ),),

                  SizedBox(
                    height: 50,
                  ),

                  ElevatedButton(onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(),));
                    
                  }, child: Text("LogIn"))
                ],
              ),
            )


            
          ],
        ),
      ),


    );
  }
}