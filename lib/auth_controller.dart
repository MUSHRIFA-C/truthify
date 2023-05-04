import 'package:demo1/home.dart';
import 'package:demo1/login.dart';
import 'package:demo1/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//it should be accesible from all page

class AuthController extends GetxController{//should be responsible for navigating different pages
  static AuthController instance = Get.find();//would able to access all the properties from any page
  late Rx<User?> _user;  //it include our user info
  FirebaseAuth auth= FirebaseAuth.instance;//authentication

  @override   //initialization the things come from ntwrk
  void onReady(){
    super.onReady();
    _user =  Rx<User?>(auth.currentUser);//cast to getx so we user Rx<User?>
//when user is alive the user itself notified because of bindStramfunction
    _user.bindStream(auth.userChanges());//to track user things we use bindStream
    //it will be listening all the time the changes
    ever(_user,_initialScreen);//ever function takes a listener and callback func
  }
  _initialScreen(User? user){
    if(user==null){
      print("login page");
      Get.offAll(()=>Login());

    }else{
      Get.offAll(()=>HomePage(email:user.email));
    }
  }
  void register(String email,password)async{
    try{
      await  auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
              "Account creation failed"
          ),
          messageText: Text(e.toString()));
    }

  }
  void login(String email,password)async{
    try{
      await  auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
              "Login  failed"
          ),
          messageText: Text(e.toString()));
    }

  }
  void logOut()async{
    await auth.signOut();
  }
}