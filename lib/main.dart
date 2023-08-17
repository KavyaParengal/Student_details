
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_log/auth_controller.dart';
import 'package:firebase_log/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value)=>Get.put(AuthController()));
    runApp(
      GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
      )
  );
}
