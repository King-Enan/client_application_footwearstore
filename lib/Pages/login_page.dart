import 'package:client_application/Pages/register_page.dart';
import 'package:client_application/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(

          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blueGrey[50],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('WELCOME', style:
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.deepPurple,
                ),),
                SizedBox(height: 20,),

                TextField(
                  controller:  ctrl.LoginEmailController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.phone_android),
                    labelText: 'Email Address',
                    hintText: 'Enter Your Email Address',

                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller:  ctrl.LoginPassController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.phone_android),
                    labelText: 'Password',
                    hintText: 'Enter Your Password',

                  ),
                ),
                SizedBox(height: 20,),

                ElevatedButton(
                    onPressed: () {
                     ctrl.signin();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: Text('Login')),
                TextButton(
                    onPressed: () {
                      Get.to(RegisterPage());
                    },
                    child: Text('Register New Account')),

              ],

            ),
          )


      );
    });
  }
}
