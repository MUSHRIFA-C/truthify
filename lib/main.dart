

import 'package:demo1/home.dart';
import 'package:demo1/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'auth_controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((value)=>Get.put(AuthController()));//because of these fun auth is available for all page
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key,});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'truthify',
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
  
