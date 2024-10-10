import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/view/home/home_view.dart';
import 'package:test_app/view/login/google_signin_viewmodel.dart';

class LoginView extends StatelessWidget {
  final GoogleSigninViewmodel _googleSigninViewmodel =
      Get.put(GoogleSigninViewmodel());
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Sign-In')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Obx(() {
              if (_googleSigninViewmodel.isLoggedIn.value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Hello ${_googleSigninViewmodel.user.value?.displayName ?? ''}!'),
                    ElevatedButton(
                        onPressed: () {
                          _googleSigninViewmodel.signOut();
                        },
                        child: const Text('Sign Out'))
                  ],
                );
              } else {
                return ElevatedButton(
                    onPressed: () {
                      _googleSigninViewmodel.googleSignIn();
                    },
                    child: const Text('Sign In'));
              }
            }),
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => HomeView());
              },
              child: const Text('Home Screen'))
        ],
      ),
    );
  }
}
