import 'dart:developer';

import 'package:local_auth/local_auth.dart';

class AuthenticationRepository {
  static final LocalAuthentication localAuth = LocalAuthentication();

  static Future<bool> canAuthenticate() async => await localAuth.canCheckBiometrics || await localAuth.isDeviceSupported();

  static Future<bool> checkAuthentication() async {
    try {
      if (await canAuthenticate()) {
        bool result = await localAuth.authenticate(
          localizedReason: "Scan you fingerprint to proceed.",
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
        if (result) {
          return true;
        } else {
          log("Permission Denied");
          return false;
        }
      } else {
        log("Biometric Sensor is not Available");
        return false;
      }
    } catch (e) {
      log("Authentication Checking Is Failed. Error: ${e.toString()}");
      return false;
    }
  }
}
