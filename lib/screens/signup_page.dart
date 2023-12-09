import 'package:flutter/material.dart';

import '../routes/route_names.dart';
import '../services/auth_controller.dart';
import '../utilities/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible=false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Hello!\nWelcome back',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  ),),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                offset: const Offset(1.2,1.2),
                                blurRadius: 1.2,
                                //spreadRadius: 1
                              )
                            ]
                        ),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your email address';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          cursorColor: primary,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 17
                              ),
                              focusColor: primary,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.all(16)
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                offset: const Offset(1.2,1.2),
                                blurRadius: 1.2,
                                //spreadRadius: 1
                              )
                            ]
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          cursorColor: primary,
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,color: Colors.teal.shade800,),
                                onPressed: () {
                                  setState(
                                        () {
                                      passwordVisible = !passwordVisible;
                                    },
                                  );
                                },
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 17
                              ),
                              focusColor: primary,
                              enabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.all(16),
                              focusedBorder: InputBorder.none
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
                        //Navigator.pushNamed(context, RouteName.login);
                      }
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      side: const BorderSide(
                          color: primary
                      ),
                      backgroundColor: primary,
                    ),
                    child: Container(
                      height: 36,
                      alignment: Alignment.center,
                      child: const Text('Sign Up',style: TextStyle(
                          color: white,
                          fontSize: 18
                      ),),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),),
                    TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, RouteName.login);
                        },
                        child: const Text('Sign in',style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: primary
                        ),)
                    )
                  ],
                ),
                Divider(thickness: 2,color: Colors.grey.shade400,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Image.asset(
                        'images/search.png',
                        width: 35,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, RouteName.phoneNumberSignin);
                      },
                      child: Image.asset(
                        'images/cell-phone.png',
                        width: 35,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
