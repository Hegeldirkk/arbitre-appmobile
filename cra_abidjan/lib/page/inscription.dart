

import 'package:cra_abidjan/main.dart';
import 'package:cra_abidjan/page/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth_service.dart';

class Inscription extends StatelessWidget {
   Inscription({Key? key}) : super(key: key);
   //final authController = Get.find<AuthService>();
  AuthService authService = Get.put(AuthService());
  @override
  Widget build(BuildContext context) {
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
                    child:  Text("Rejoindre la CRA d'Abidjan",
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: GoogleFonts.montserrat(
                          fontSize: 22,
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
                    labelText: "Email",
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
                    labelText: "Mot de Passe",
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    print(value);
                  },
                  controller: authService.inputPwdController,
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
                    labelText: "Confirmation Mot de Passe",
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    print(value);
                  },
                  controller: authService.inputConfPwdController,
                ),
              ),
              const SizedBox(height: 25,),
             /* AbsorbPointer(
                absorbing: authService.hideLogin.value,
                  child:*/InkWell(
                    onTap: (){
                      //email = authService.inputEmailController.text;
                      //print(authService.hideLogin.value);
                      print(authService.inputConfPwdController.value);
                      print(authService.inputEmailController.value);
                      authService.statusChange();
                      authService.createUserWithEmailAndPassword(authService.inputEmailController.text, authService.inputConfPwdController.text);
                      /*Get.to(() => CreateUser(), transition: Transition.upToDown,
                      duration: const Duration(seconds: 1));*/
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
                            : Text("S'inscrire",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,),);
                      }
                      ),
                    ),
                  ),//),


            ],
          ),
        )
    );
  }
}

class CreateUser extends StatelessWidget {
   CreateUser({Key? key}) : super(key: key);

   //AuthService contService = Get.put(AuthService());
   final authService = Get.find<AuthService>();
   @override
  Widget build(BuildContext context) {
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
                    child:  Text("Rejoindre la CRA d'Abidjan",
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: GoogleFonts.montserrat(
                          fontSize: 22,
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
                      Icons.person_outline,
                      color: Colors.grey,
                    ),
                    //prefixText: '+225',
                    border: InputBorder.none,
                    labelText: "Nom & Prenoms",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {

                  },
                  controller: authService.inputNomController,
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
                    labelText: "Telephone",
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {

                  },
                  controller: authService.inputNumController,
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    width: width * 0.4,
                    padding: const EdgeInsets.fromLTRB(25, 2, 10, 2),
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
                    child:Obx(() => DropdownButton<String>(
                      value: authService.dropdownValuePromo.value,
                      icon: const Icon(Icons.arrow_circle_down),
                      elevation: 14,
                      style: const TextStyle(color: Color(0xFF284620)),
                      onChanged: (String? newValue) {
                        authService.dropdownValuePromo.value = newValue!;
                      },
                      items: <String>['DANON', 'MIAN', 'DOUE']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )),
                  Container(
                    width: width * 0.4,
                    padding: const EdgeInsets.fromLTRB(25, 2, 10, 2),
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
                    child:Obx(() => DropdownButton<String>(
                      value: authService.dropdownValueGrade.value,
                      icon: const Icon(Icons.arrow_circle_down),
                      elevation: 14,
                      style: const TextStyle(color: Color(0xFF284620)),
                      /*underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),*/
                      onChanged: (String? newValue) {
                        print(newValue);
                        authService.updateDropGrade(newValue!);
                      },
                      items: <String>['ELEVE', 'REGIONAL', 'LIGUE', 'FEDERAL']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),)
                  ),
                ],
              ),
              const SizedBox(height: 25,),
             GestureDetector(
                    onTap: (){
                      print(email);
                      authService.statusChange();
                      authService.addUser(email!, authService.inputNomController.value.text, authService.inputNumController.value.text, authService.dropdownValueGrade.value, authService.dropdownValuePromo.value);
                      //Get.to(() => Home(), transition: Transition.circularReveal, duration: const Duration(seconds: 2));
                    },
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.3,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color(0xFF284620),
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      child:Obx(() {
                        return authService.load.value
                            ? CircularProgressIndicator(color: Colors.white,)
                            : Text("Coup de Sifflet",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,),);
                      }
                      ),
                    ),
                  ),


            ],
          ),
        )
    );
  }
}

