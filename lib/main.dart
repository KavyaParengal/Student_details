
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_log/routes/route_names.dart';
import 'package:firebase_log/routes/route_navigation.dart';
import 'package:firebase_log/services/auth_controller.dart';
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
        initialRoute: RouteName.login,
        onGenerateRoute: RouteNavigation.generateRoute,
        debugShowCheckedModeBanner: false,
      )
  );
}
