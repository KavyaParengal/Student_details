
import 'package:flutter/material.dart';

import '../routes/route_names.dart';
import '../utilities/colors.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Image.asset('images/group.png',
          width: 25,
          color: white,
        ),
        backgroundColor: primary,
        onPressed: () {
          Navigator.pushNamed(context, RouteName.home);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Enter User Details!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),),
              CircleAvatar(
                radius: 54,
                backgroundColor: black,
                child: CircleAvatar(
                  radius: 53,
                  backgroundColor: primary,
                  child: Image.asset('images/image.png',
                    color: white,
                    width: 40,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Name should not be empty';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        hintText: 'Name',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 16
                          ),
                        focusColor: primary,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primary)
                        )
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Age should not be empty';
                        }
                        return null;
                      },
                      controller: ageController,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          hintText: 'Age',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 16
                          ),
                          focusColor: primary,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: primary)
                          )
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: TextButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, RouteName.home);
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Enter a valid data'),
                          backgroundColor: Colors.grey,
                        ),
                      );
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
                    child: const Text('Save',style: TextStyle(
                        color: white,
                        fontSize: 18
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
