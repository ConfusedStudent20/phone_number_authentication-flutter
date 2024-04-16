import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp_verification/app_Theme.dart';
import 'package:otp_verification/screens/dash_Screen.dart';
import 'package:otp_verification/screens/home_Screen.dart';
import 'package:otp_verification/screens/phone_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDPkMtOprEk3yXgKTTIvvO20CW9ahrqLlc",
      appId: "1:197747978101:android:f52d53469e68394f7d2d3c",
      messagingSenderId: "197747978101",
      projectId: "otpcode-b00e1",
      storageBucket: "otpcode-b00e1.appspot.com",
    ),
  );
  //   await PhoneAuthentication().signOut(); // Sign out the user

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme().lightTheme,
      home: const HomeScreen(),
      routes: {
        '/homeScreen': (_) => const HomeScreen(),
        // '/otpScreen': (_) => const OTPScreen(
        //       verification: '',
        //     ),
        '/phoneScreen': (_) => const PhoneScreen(),
        '/dashScreen': (_) => DashScreen(),
      },
    );
  }
}
