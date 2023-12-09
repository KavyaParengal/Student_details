
import 'package:flutter/material.dart';

import '../routes/route_names.dart';
import '../utilities/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, RouteName.addUser);
          },
          icon: const Icon(Icons.add),
          label: const Text("Add Student"),
          backgroundColor: primary,
        ),
      ),
      appBar: AppBar(
        backgroundColor: primary,
        leadingWidth: MediaQuery.of(context).size.width,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey,),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.logout),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Age Range: ${_currentSliderValue.toStringAsFixed(0)} - 50',style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
                Slider(
                  value: _currentSliderValue,
                  max: 50,
                  divisions: 5,
                  activeColor: primary,
                  mouseCursor: SystemMouseCursors.basic,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return Column(
                      children: [
                        const Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: primary,
                              backgroundImage: AssetImage(
                                  'images/image.png'
                              ),
                            ),
                            SizedBox(width: 18,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('kavya',style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20
                                ),),
                                SizedBox(height: 8,),
                                Text('21',style: TextStyle(
                                    fontSize: 15
                                ),),
                              ],
                            )
                          ],
                        ),
                        Divider(color: Colors.grey.shade300,)
                      ],
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

