import 'package:client_application/Pages/login_page.dart';
import 'package:client_application/controller/login_controller.dart';
import 'package:client_application/widgets/otp_txt_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Create Your Account', style:
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.deepPurple,
            ),),
            SizedBox(height: 20,),

            TextField(
              controller: ctrl.RegisterNameController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.phone_android),
                labelText: 'Your Name',
                hintText: 'Enter Your Name',

              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller:  ctrl.RegisterEmailController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.email),
                labelText: 'Email Address',
                hintText: 'Enter Your Email Address',

              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller:  ctrl.RegisterPassController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.phone_android),
                labelText: 'Password',
                hintText: 'Enter Your Password',

              ),
            ),
            // OtpTextField(otpcontroller: ctrl.otpcontroller, visible: ctrl.otpFieldshown, onComplete: (otp) { ctrl.otpEnter = int.tryParse(otp ?? '0000' );},),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () async {
                  ctrl.signup();
                 ctrl.RegisterPassController.clear();
                   ctrl.RegisterEmailController.clear();ctrl.RegisterNameController.clear();

                },


                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                ),
                child: Text("Register")),
            TextButton(
                onPressed: () {
                 Get.to(LoginPage());
                },
                child: Text('Log in ')),
          ],
        ),

      );
    });
  }
}
