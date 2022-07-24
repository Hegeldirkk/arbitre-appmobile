import 'package:cra_abidjan/page/inscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

final spinkit = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);

class _LoginState extends State<Login> {
  TextEditingController inputEmailController = TextEditingController();
  TextEditingController inputPwdController = TextEditingController();
  bool hidePwd = true;

  @override
  Widget build(BuildContext context) {
    AuthService authService = Get.put(AuthService());
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/account.png',
              alignment: Alignment.center,
              filterQuality: FilterQuality.high,
              height: 310,
              fit: BoxFit.cover,
            ),
            Padding(padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child:  Align(
                  alignment: Alignment.centerLeft,
                  child:  Text("Me connecter",
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
            const SizedBox(height: 60,),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
              margin: EdgeInsets.fromLTRB(width * 0.05, height * 0.009, width * 0.05, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  ),
                  //prefixText: '+225',
                  border: InputBorder.none,
                  labelText: "Inserer votre email",
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {

                },
                controller: authService.inputEmailController,
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
              margin: EdgeInsets.fromLTRB(width * 0.05, height * 0.009, width * 0.05, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
                  // prefixText: '+225',
                  border: InputBorder.none,
                  labelText: "Inserer votre mopt de passe ",
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {

                },
                controller: authService.inputPwdController,
              ),
            ),
            const SizedBox(height: 25,),
          InkWell(
                  onTap: (){
                    authService.statusChange();
                    authService.signUserWithEmailAndPassword(authService.inputEmailController.text, authService.inputPwdController.text);
                    //Get.to(() => const );
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.3,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color(0xFF284620),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Obx(() {
                      return authService.load.value
                          ? CircularProgressIndicator(color: Colors.white,)
                          : Text("Se connecter",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,));
                    }
                    ),
                ),
          ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Get.to(()=>Inscription(), transition: Transition.upToDown);
              },
              child: Text(
                'Creer un compte',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Campton_Light",
                  fontSize: 14.0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            )
          ],

        ),
      )
    );
  }
}
