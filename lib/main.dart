import 'package:e_nursury/view/Add-to-Cart.dart';
import 'package:e_nursury/view/Decision_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //       apiKey: 'AIzaSyCvVjM2l-qFGhK2XYS3d7NwmmezbkBKNRM',
  //       appId: '1:70240798207:android:fd0d788c50d448fa7dd3ca',
  //       messagingSenderId: 'messagingSenderId',
  //       projectId: 'nursery-5ee5d',
  //       storageBucke t: 'storageBucket',   )
  // );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'E - Nursury',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Add_to_Cart(),
    );
  }
}




