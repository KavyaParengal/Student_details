import 'package:firebase_log/routes/route_names.dart';
import 'package:flutter/material.dart';

import '../screens/add_user_page.dart';
import '../screens/home_page.dart';
import '../screens/login_page.dart';
import '../screens/phone_number_signin.dart';
import '../screens/signup_page.dart';

class RouteNavigation{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){

      case RouteName.login:
        return MaterialPageRoute(builder: (context)=>const LoginPage());

      case RouteName.signup:
        return MaterialPageRoute(builder: (context)=>const SignUpPage());

      case RouteName.home:
        return MaterialPageRoute(builder: (context)=>const HomePage());

      case RouteName.addUser:
        return MaterialPageRoute(builder: (context)=>const AddUserScreen());

      case RouteName.phoneNumberSignin:
        return MaterialPageRoute(builder: (context)=>const SigninWithPhoneNumber());

      default:
        return MaterialPageRoute(builder: (context)=>Scaffold(
          body: Center(
            child: Text('No Route Found ${settings.name}'),
          ),
        ));
    }
  }
}