import 'package:demo1/forgot.dart';
import 'package:demo1/home.dart';
import 'package:flutter/material.dart';
import 'Signup.dart';
import 'auth_controller.dart';


class Login extends StatefulWidget {
  const Login ({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  var emailCon = TextEditingController();
  var passCon = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("LOGIN",style: TextStyle(color: Colors.black45,fontSize:25,fontWeight: FontWeight.bold)),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: emailCon,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,color: Colors.purple,),
                      label: Text("Email",style: TextStyle(color: Colors.purple),),
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
                          borderRadius: BorderRadius.circular(20)
                      ))

              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: passCon,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock,color: Colors.purple,),
                      label: Text("Password",style: TextStyle(color: Colors.purple),),
                      // hintText: "Username",
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
                          borderRadius: BorderRadius.circular(20)
                      ))
    ),),
    SizedBox(height: 10,),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        child: TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgotpwd()));
         },
    child: Text("Forgot your Password?",style: TextStyle(fontSize: 16,color: Colors.purple),),
          ),
      ),],),


            SizedBox(height: 20,),
    ElevatedButton(onPressed: (){
      AuthController.instance.login(emailCon.text.trim(), passCon.text.trim());
    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      },
    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),primary: Colors.purple,fixedSize: Size(350, 57)),
    child: Text("LOGIN",style: TextStyle(
    fontSize: 15,color: Colors.white
    )),),

    SizedBox(height: 10,),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text("dont't have an account?",style: TextStyle(fontSize: 16,color: Colors.purple),),
      TextButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
    },
    child: Text("Sign Up",style: TextStyle(fontSize: 20,color: Colors.purple,fontWeight: FontWeight.bold),))

    ],

    ),

    ],
    )
    ), ), ), );






 }
}








