
import 'package:demo1/Signup.dart';
import 'package:demo1/login.dart';
import 'package:flutter/material.dart';
class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Text("WELCOME TO TRUTHIFY",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.purple),),
                  ),

                  SizedBox(height: 30,),
                  Image.asset("images/s2.jpg",
                  width: 800, height: 300,
                      ),
                  SizedBox(height: 90,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
        },
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),primary: Colors.purple,fixedSize: Size(350, 57)),
          child: Text("Login",style: TextStyle(
              fontSize: 18,color: Colors.white
          ),
          ),),
          SizedBox(height: 35,),

          ElevatedButton(onPressed: (){
             Navigator.push(context,MaterialPageRoute(builder: (context)=>Signup()));
        },
        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),primary: Colors.purple,fixedSize: Size(350, 57)),
        child: Text("Sign Up",style: TextStyle(
        fontSize: 18,color: Colors.white
        )),),
        ],
              ),
            ),
            ),

          ),

    );
  }
}

