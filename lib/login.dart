
import 'package:firebase_log/auth_controller.dart';
import 'package:firebase_log/homepage.dart';
import 'package:firebase_log/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade700
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Login",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'EBGaramond',),),
                  SizedBox(height: 8,),
                  Text("Welcome Back !",style: TextStyle(fontSize: 18.5,color: Colors.white),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(height: 60,),
                      Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                                color: Colors.blueGrey.shade700,
                                blurRadius: 20,
                                offset: Offset(0, 10)
                            )]
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                              ),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    hintText: "Email or User Name",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                              ),
                              child: TextField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      TextButton(child: Text('Forgot Password?',style: TextStyle(color: Colors.grey.shade600,fontSize: 16),),
                        onPressed: (){},
                      ),
                      SizedBox(height: 25,),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10,),
                          color: Colors.blueGrey.shade700
                        ),
                        child: Center(
                          child: TextButton(
                            child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                            onPressed: (){
                              AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an Account?",style: TextStyle(fontSize: 16,color: Colors.grey),),
                          TextButton(child: Text('Sign UP',style: TextStyle(color: Colors.grey.shade600,fontSize: 16),),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
