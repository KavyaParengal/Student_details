
import 'package:flutter/material.dart';
import '../utilities/colors.dart';

class SigninWithPhoneNumber extends StatefulWidget {
  const SigninWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<SigninWithPhoneNumber> createState() => _SigninWithPhoneNumberState();
}

class _SigninWithPhoneNumberState extends State<SigninWithPhoneNumber> {

  TextEditingController phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
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
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Invalid phone number';
                }
                if (value.length != 10) {
                  return 'Mobile Number must be of 10 digit';
                }
                return null;
              },
              controller: phoneNumberController,
              cursorColor: primary,
              decoration: InputDecoration(
                  hintText: 'Enter your phone Number',
                  hintStyle: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 17
                  ),
                  prefixText: '+91',
                  focusColor: primary,
                  enabledBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                  focusedBorder: InputBorder.none
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextButton(
              onPressed: (){
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('We have blocked all requests from this device due to unusual activity. Try again later!'),
                      backgroundColor: Colors.grey.shade900,
                    ),
                  );
                }
                // else{
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text('We have blocked all requests from this device due to unusual activity. Try again later!'),
                //       backgroundColor: Colors.grey.shade900,
                //     ),
                //   );
                // }
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
                alignment: Alignment.center,
                child: const Text('Get OTP',style: TextStyle(
                    color: white,
                    fontSize: 18
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
