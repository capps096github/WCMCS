import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../wcmcs_exporter.dart';

class WcmcsHome extends StatelessWidget {
  const WcmcsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: const [
            Icon(Icons.home, color: Colors. blue, size: 100,),
           Center(
            child:Column(
              children: [
                Text("Welcome to WCMCS", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(height: 10),
                Text("This is the home page of the WCMCS app", style: TextStyle(fontSize: 20),),
                SizedBox(height: 50),
                Text("You are almost there", style: TextStyle(fontSize: 30),),
                SizedBox(height: 10),
                Text("Here is what Water Consumption Monitoring and Control System can do for you", style: TextStyle(fontSize: 20),),
                

              ],
           ),),
          ]
    ),
    ),
    );
  }
}