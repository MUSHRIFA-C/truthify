
import 'package:demo1/login.dart';
import 'package:flutter/material.dart';

class Forgotpwd extends StatefulWidget {
  const Forgotpwd({Key? key}) : super(key: key);

  @override
  State<Forgotpwd> createState() => _ForgotpwdState();
}

class _ForgotpwdState extends State<Forgotpwd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       /* decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/p4.jpg"),
                fit: BoxFit.cover)
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("FORGET PASSWORD",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black45),),
            SizedBox(height: 25,),
            Align(
              alignment: Alignment.center,
              child: Text("we will send  a verification code to your email",style: TextStyle(fontSize: 15,color: Colors.purple),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,color: Colors.purple),
                      label: Text("Email"),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.purple,
                              width: 1.5
                          )
                      ), enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.purple,
                          width: 1.5
                      )
                  ),
                      border: OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(20)

                      ))

              ),
            ),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
        },
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),primary: Colors.purple,fixedSize: Size(350, 57)),
          child: Text("SUBMIT",style: TextStyle(
              fontSize: 15,color: Colors.white
          )),),
     ] ),
      ),
    );
  }
}