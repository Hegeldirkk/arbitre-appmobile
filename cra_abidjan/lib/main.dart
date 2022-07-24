import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cra_abidjan/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config/user.dart';
import 'firebase_options.dart';
import 'page/auth.dart';
import 'screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //runApp(const MyApp());
  runApp(const GetMaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

String? token;
String? tokLog;
String? email;
CollectionReference users = FirebaseFirestore.instance.collection('users');
final user = FirebaseAuth.instance.currentUser;
late Arbitre arbitre;


class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
            primaryColor: Colors.white
        ),
        debugShowCheckedModeBanner: false,
        home: const Splash(),
        //initialRoute: '/',
        routes: {
          AuthPage.id: (context) => const AuthPage(),
        },
      )/*,
    )*/;
  }
}

