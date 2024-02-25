import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hitchify/UI/splash_screen.dart';
import 'package:hitchify/core/app_export.dart';
// import 'package:hitchify/signin.dart';
import 'package:hitchify/theme/theme_helper.dart';
import 'package:hitchify/UI/auth/loginWithPhone.dart';
import 'package:hitchify/home/locationpage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter binding is initialized
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print("Error initializing Firebase: $e");
  } // ThemeHelper().changeTheme('primary');

  runApp(const Pooling());
}

class Pooling extends StatelessWidget {
  const Pooling({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: SplashScreen(),
    );
  }
}

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:hitchify/firebase_options.dart';
// import 'package:hitchify/home/locationpage.dart';
// import 'package:hitchify/home/home_screen.dart';
// import 'package:hitchify/UI/splash_screen.dart';
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(
//       // LocationAccess()
//       // HomeScreen()
//     SplashScreen()
//       );
// }
//
//
