// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hitchify/cnic.dart';
import 'package:hitchify/profile.dart';
import 'package:hitchify/register.dart';
import 'package:hitchify/vehicle.dart';

class VehicleInfo extends StatelessWidget {
  const VehicleInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Vehicle Info')),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Brand'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Profile()));
                },
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Model'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  // Navigator.pushNamed(context, '/cnic');
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>CNIC()));
                },
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Color'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  // Navigator.pushNamed(context, '/register');
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Register()));
                },
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Photo of Vehicle'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Register()));
                },
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Driving License'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Register()));
                },
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Vehicle Certificate'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Register()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Vehicle()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF008955),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  child: Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
