
import 'package:firebase_log/auth_controller.dart';
import 'package:firebase_log/homepage.dart';
import 'package:firebase_log/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade600
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign UP",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'EBGaramond',color: Colors.white),),
                  SizedBox(height: 8,),
                  Text("Create a free account here !",style: TextStyle(fontSize: 18.5,color: Colors.white),),
                ],
              ),
            ),
            SizedBox(height: 40,),
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
                      SizedBox(height: 80,),
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
                                    hintText: "Email",
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
                      SizedBox(height: 60,),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10,),
                            color: Colors.blueGrey.shade700
                        ),
                        child: Center(
                          child: TextButton(
                            child: Text('Sign UP',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                            onPressed: (){
                              AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an Account?",style: TextStyle(color: Colors.grey,fontSize: 16),),
                          TextButton(child: Text('Login',style: TextStyle(color: Colors.grey.shade600,fontSize: 16),),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
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
