
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_log/homepage.dart';
import 'package:firebase_log/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  static AuthController instance=Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth=FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if(user==null){
      print("Login page");
      Get.offAll(()=>LoginPage());
    }
    else{
      Get.offAll(()=>HomePage(emailId:user.email));
      print('Email= ${user.email}');
    }
  }

  void register(String email,password) async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.offAll(()=>LoginPage());
    }
    catch(e){
      Get.snackbar("About user", "User message", backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Account creation failed"),
          messageText: Text(e.toString()));
    }
  }

  void login(String email,password) async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      Get.snackbar("About Login", "Login message", backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Login failed"),
          messageText: Text(e.toString()));
    }
  }

  void logout() async{
    await auth.signOut();
  }
}

