
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Fpassword extends StatefulWidget {
  const Fpassword({Key? key}) : super(key: key);

  @override
  State<Fpassword> createState() => _FpasswordState();
}

class _FpasswordState extends State<Fpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("Images/img_1.png"),
                fit: BoxFit.fill)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Forgot Password",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Align(
              alignment: Alignment.center,
              child: Text("we will send  a verification code to your email",style: TextStyle(fontSize: 20,color: Colors.indigo),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      label: Text("Email"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ))

              ),
            ),
                Text("Forgot Password"),
          ],
        ),
      ),);
  }
}