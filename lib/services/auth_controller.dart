
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../routes/route_names.dart';
import '../utilities/colors.dart';

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
      Get.offAll(()=>RouteName.login);
    }
    else{
      Get.offAll(()=>RouteName.home);
      print('Email= ${user.email}');
    }
  }


  void register(String email,password) async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.offAll(()=>RouteName.login);
    }
    catch(e){
      Get.snackbar("About user", "User message", backgroundColor: primary,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text("Account creation failed"),
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
          titleText: const Text("Login failed"),
          messageText: Text(e.toString()));
    }
  }

  void signInWithGoogle() async{
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential = await auth.signInWithCredential(credential);
    print(userCredential.user?.displayName);
  }

  Future<void> addStudentDetails(String name, int age, String photoUrl) async {
    final user = FirebaseAuth.instance.currentUser;
    final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

    if (user != null) {
      await userCollection.doc(user.uid).collection('students').add({
        'name': name,
        'age': age,
        'photoUrl': photoUrl,
      });
    }
  }

  Stream<QuerySnapshot> getStudentDetails() {
    final user = FirebaseAuth.instance.currentUser;
    final CollectionReference userCollection = FirebaseFirestore.instance
        .collection('users');

    if (user != null) {
      return userCollection.doc(user.uid).collection('students').snapshots();
    } else {
      return const Stream<QuerySnapshot>.empty();
    }
  }

  void logout() async{
    await auth.signOut();
  }
}

