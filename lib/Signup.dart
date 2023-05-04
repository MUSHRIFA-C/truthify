import 'package:demo1/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:demo1/login.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailCon = TextEditingController();
    var passCon = TextEditingController();


    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Column(
                children: [
                  Text("SIGNUP",style: TextStyle(color: Colors.black45,fontSize:25,fontWeight: FontWeight.bold)),

                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person,color: Colors.purple),
                            label: Text("Name",style: TextStyle(color: Colors.purple),),
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

                    ),
                  ),

                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: emailCon,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email,color: Colors.purple),
                            label: Text("Email",style: TextStyle(color: Colors.purple)),
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

                    ),
                  ),

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: passCon,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock,color: Colors.purple),
                            label: Text("password",style: TextStyle(color: Colors.purple)),
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
                    ),
                  ),

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock,color: Colors.purple),
                            label: Text("Confirm Password",style: TextStyle(color: Colors.purple)),
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
                    ),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    AuthController.instance.register(emailCon.text.trim(),passCon.text.trim());
                    /*Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));*/
                  },
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),primary: Colors.purple,fixedSize: Size(350, 57)),
                    child: Text("SIGNUP",style: TextStyle(
                        fontSize: 15,color: Colors.white
                    )),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already  have an acoount?",style: TextStyle(fontSize: 16,color: Colors.purple),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                      },
                          child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.purple,fontWeight: FontWeight.bold),))

                    ],
                  ),
                ]),
          )
      ),

    ),);
  }
}