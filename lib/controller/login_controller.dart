import 'dart:math';

import 'package:client_application/Pages/Homepage.dart';
import 'package:client_application/Pages/login_page.dart';
import 'package:client_application/model/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class LoginController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;
  TextEditingController RegisterNameController = TextEditingController();
  TextEditingController RegisterEmailController = TextEditingController();
  TextEditingController RegisterPassController = TextEditingController();
  OtpFieldControllerV2 otpcontroller = OtpFieldControllerV2();

  final box = GetStorage();
  bool otpFieldshown = false;
  int? otpSend;

  int? otpEnter;



  //for log in page
  TextEditingController LoginEmailController = TextEditingController();
  TextEditingController LoginPassController = TextEditingController();
  // @override
  // void onReady() {
  //   // TODO: implement onReady
  //   Map<String, dynamic>? user = box.read('loginUser');
  //   if (user != null) {
  //     loginUser = User.fromJson(user);
  //     Get.to(HomePage());
  //   }
  // }
  signup()async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: RegisterEmailController.text , password: RegisterPassController.text);
      Get.to(LoginPage());
      Get.snackbar("Successfull", "Account Registered Successfully");
    }  catch (e) {
      Get.snackbar('Error', "User or Password Or email Invalid");

      // TODO
    }
  }
  signin() async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: LoginEmailController.text, password: LoginPassController.text);
      Get.to(HomePage());

    } catch (e) {
      Get.snackbar('Error', "User or Passoword Invalid",colorText: Colors.red);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    userCollection = firestore.collection('users');
    super.onInit();
  }

// addUser() {
//   if (otpSend == otpEnter) {
//     try {
//       if (RegisterNumberController.text.isEmpty ||
//           RegisterNameController.text.isEmpty) {
//         Get.snackbar('Error', e.toString(), colorText: Colors.red);
//         return;
//       }
//       DocumentReference doc = userCollection.doc();
//       User user = User(
//         id: doc.id,
//         name: RegisterNameController.text,
//         number: int.parse(RegisterNumberController.text),
//
//       );
//       final userJson = user.toJson();
//       doc.set(userJson);
//       Get.snackbar('Success', 'User added successfully',
//           colorText: Colors.indigoAccent);
//     } catch (e) {
//       Get.snackbar('Error', e.toString(), colorText: Colors.greenAccent);
//       print(e);
//     };
//   }


//   else {
//     Get.snackbar('Error', e.toString(), colorText: Colors.greenAccent);
//   }
// }

// sendOTP() {
//   try {
//     if (RegisterNumberController.text.isEmpty ||
//         RegisterNameController.text.isEmpty) {
//       Get.snackbar('Error', e.toString(), colorText: Colors.red);
//       return;
//     }
//     final random = Random();
//     int otp = 1000 + random.nextInt(9000);
//     print(otp);
//     if (otp != null) {
//       otpFieldshown = true;
//       otpSend = otp;
//       Get.snackbar(
//           'Success', 'OTP sent successfully', colorText: Colors.green);
//     } else {
//       Get.snackbar('Error', 'OTP not Sent', colorText: Colors.red);
//     }
//   } catch (e) {
//     print(e);
//   } finally {
//     update();
//   }
// }

// Future<void> loginWithphone() async {
//   try {
//     String phoneNumber = LoginNumberController.text;
//     if (phoneNumber.isNotEmpty) {
//       var querySnapshot = await userCollection.where(
//           'number', isEqualTo: int.tryParse(phoneNumber)).limit(1).get();
//       if (querySnapshot.docs.isNotEmpty) {
//         var userdoc = querySnapshot.docs.first;
//         var userdata = userdoc.data() as Map<String, dynamic>;
//        box.write('loginUser', userdata);
//        LoginNumberController.clear();
//        Get.to(HomePage());
//        Get.snackbar(
//             'Success', 'Log in Successfull', colorText: Colors.green);
//       }
//       else {
//         Get.snackbar('Error', "User Not Found");
//       }
//     }
//
//     else {
//       Get.snackbar("Error", 'Please Input your Phone Number!');
//     }
//   }
//   catch (error) {
//     print("Failed to Log In");
//   }
// }}
}
