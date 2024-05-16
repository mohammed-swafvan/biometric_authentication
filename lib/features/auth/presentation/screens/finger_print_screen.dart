import 'package:biometric_authentication/features/auth/domain/repository/authentication_repository.dart';
import 'package:biometric_authentication/features/auth/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FingerPrintScreen extends StatelessWidget {
  const FingerPrintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            Lottie.asset(
              "assets/animations/finger_print_animation.json",
              width: screenWidth / 2.5,
              height: screenWidth / 2.5,
              repeat: true,
              reverse: true,
              fit: BoxFit.cover,
              backgroundLoading: true,
            ),
            const SizedBox(height: 40),
            const Text(
              "Fingerprint Auth",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Authenticate using fingerprint to proceed  in Application",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: screenWidth / 2,
              child: ElevatedButton(
                onPressed: () async {
                  AuthenticationRepository.authenticateUser().then((val) {
                    if (val) {
                      Get.to(
                        const HomeScreen(),
                        transition: Transition.fadeIn,
                      );
                    }
                  });
                },
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all<double>(4.0),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
