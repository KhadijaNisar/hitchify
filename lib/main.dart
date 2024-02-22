import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hitchify/firebase_options.dart';
import 'package:hitchify/home/locationpage.dart';
import 'package:hitchify/home/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
      // LocationAccess()
      HomeScreen()
      );
}


