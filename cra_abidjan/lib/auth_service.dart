

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cra_abidjan/config/user.dart';
import 'package:cra_abidjan/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import 'config/userSecure.dart';
import 'page/connexion.dart';
import 'page/home.dart';
import 'page/inscription.dart';

class AuthService extends GetxController{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  TextEditingController inputEmailController = TextEditingController();
  TextEditingController inputNomController = TextEditingController();
  TextEditingController inputPreController = TextEditingController();
  TextEditingController inputPwdController = TextEditingController();
  TextEditingController inputConfPwdController = TextEditingController();
  TextEditingController inputNumController = TextEditingController();
  TextEditingController inputGradeController = TextEditingController();
  TextEditingController inputProController = TextEditingController();
  RxBool hideLogin = false.obs;
  RxBool load = false.obs;
  final dropdownValueGrade = 'ELEVE'.obs;
  final dropdownValuePromo = 'DANON'.obs;
  static AuthService get to => Get.find();


  updateDropGrade(String name) {
    dropdownValueGrade(name);
  }

  statusChange() {
    if(load.isTrue){
      load(false);
    } else {
      load(true);
    }
    //load();
  }

  getInfoArbitre()async{
   final userId =  await UserSecureStorage.getTokenAuth();
    users.doc(userId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        arbitre = Arbitre.fromJson(documentSnapshot.data() as Map<String,dynamic>);
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  Future<void> createUserWithEmailAndPassword(String emailAddress, String password) async {
    load(true);
    try {
       await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      ).then((value) async {
        if (value != null){
          var uuid = Uuid();
          token = uuid.v4();
          await UserSecureStorage.setTokenAuthIns(token!);
          print(value.user);
          tokLog = value.user!.uid;
          email = value.user!.email;
          load(false);
          Get.snackbar(
              'Inscription',
                  '${value.user!.email} inscrit avec succes!',
              snackPosition: SnackPosition.TOP, backgroundColor: Colors.lightGreen, colorText: Colors.white);
          Get.to(() => CreateUser(), transition: Transition.leftToRightWithFade, duration: const Duration(seconds: 1));
        }else{
          signOut();
          Get.to(()=> Inscription(), transition: Transition.noTransition);
        }
      });
    } on FirebaseAuthException catch (e) {
      load(false);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

  }

  Future<void> addUser(String email,String nom, String tel, String grade, String promo) async {
    load(true);
    var userDataMap = {
      'id': tokLog,
      'number': tel,
      'name': nom,
      'userId': '',
      'email': email,
      'role': '0',
      'grade': grade,
      'promotion': promo,
      'complete': 0,
      'created_at': DateTime.now().toString(),
    };
    
    await users.add(userDataMap).then((value) async {
      if (value != null) {
        print(value.id);
        user?.updateDisplayName(value.id);
        await UserSecureStorage.setTokenAuth(value.id);
        await users.doc(value.id).update({'userId': value.id}).then((value) => printInfo(info: 'ok')).catchError((error) => print("Failed to add user: $error"));
        Get.snackbar(
            'Profile',
            'Profile mis a jour avec succes!',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.lightGreen,
            colorText: Colors.white);
        load(false);
        signOut();
        Get.to(() => Login(), transition: Transition.circularReveal,
            duration: const Duration(seconds: 1));
      }
    }).catchError((error) {
      load(false);
      print("Failed to add user: $error");
    });
  }

  Future<void> signUserWithEmailAndPassword(String emailAddress, String password) async {
    load(true);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      ).then((value) async{
        if (value != null){
          await UserSecureStorage.setTokenAuth(value.user!.displayName!);
          users.doc(value.user!.displayName)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              print('Document data: ${documentSnapshot.data()}');
              arbitre = Arbitre.fromJson(documentSnapshot.data() as Map<String,dynamic>);
              Get.to(() => Home(), transition: Transition.circularReveal,
                  duration: const Duration(seconds: 1));
            } else {
              print('Document does not exist on the database');
            }
          });
          print(value.user);
          load (false);
        }
      });
    } on FirebaseAuthException catch (e) {
      load(false);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

  }
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}