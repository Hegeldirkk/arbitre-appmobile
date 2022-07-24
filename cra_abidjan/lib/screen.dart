import 'dart:async';

import 'package:cra_abidjan/page/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth_service.dart';
import 'config/user.dart';
import 'config/userSecure.dart';
import 'config/widget_anim.dart';
import 'main.dart';
import 'page/connexion.dart';
import 'page/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    myToken(context);
    // TODO: implement initState
    super.initState();
  }

  Future<void> myToken(context) async {
    token = await UserSecureStorage.getTokenAuth();
    //final auth = Provider.of<AuthProvider>(context, listen: false);
    Timer(
        const Duration(
          milliseconds: 500,
          seconds: 3,
        ), () async {
      Navigator.pushReplacementNamed(context, AuthPage.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const  Color(0xfffbfbfb),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const Spacer(),
          Center(
            child: Image.asset(
              'assets/logo/lo.png',
              alignment: Alignment.center,
              filterQuality: FilterQuality.high,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(),
          AnimationWidget(
              delay: 1300,
              x: 0.0,
              y: 1.0,
              child: Padding(padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                child:Text("powered by DANON ROLAND PROMOTION",
                  textAlign: TextAlign.left,
                  maxLines: 3,
                  style: GoogleFonts.raleway(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w800
                  ),
                ),)
          ),
         const SizedBox(height: 20,)
        ],
      )
    );
  }
}
