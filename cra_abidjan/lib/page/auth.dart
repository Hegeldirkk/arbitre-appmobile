import 'package:cra_abidjan/page/connexion.dart';
import 'package:cra_abidjan/page/inscription.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  static const String id="authPage";

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool hideLogin = false;
  bool hideRegister = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/login.png',
              alignment: Alignment.center,
              filterQuality: FilterQuality.high,
              height: 310,
              fit: BoxFit.cover,
            ),
            Padding(padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child:  Align(
                  alignment: Alignment.centerLeft,
                  child:  Text("Authentification",
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    style: GoogleFonts.montserrat(
                        fontSize: 24,
                        color: Colors.black87,
                        fontWeight: FontWeight.w800
                    ),
                  ),
                )
            ),
            const SizedBox(height: 90,),
            GestureDetector(
                  onTap: (){
                     Get.to(() => const Login(), transition: Transition.zoom,
                     duration: const Duration(seconds: 1,)
                     );
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.3,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color(0xFF284620),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Text("Se connecter",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,),),
                  ),
                ),
            const SizedBox(height: 12,),
            GestureDetector(
                  onTap: (){
                    Get.to(() => Inscription(), transition: Transition.leftToRightWithFade,
                        duration: const Duration(seconds: 1,)
                    );
                    },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF284620)),
                        borderRadius: const BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Text("S'inscrire",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: const Color(0xFF284620),
                        fontWeight: FontWeight.w800,
                        fontSize: 18,),),
                  ),
                ),
          ],
        ),
    );
  }
}
