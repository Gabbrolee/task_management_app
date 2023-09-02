import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/common/helpers/db_helper.dart';
import 'package:task_management_app/common/widget/alert_dialog.dart';
import 'package:task_management_app/common/constant/route.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth;
  AuthRepository({required this.firebaseAuth});

  void verifyOtp(
      {required BuildContext context,
      required String smsCodeId,
      required String smsCode,
      required bool mounted}) async {
    try {
      final credential = PhoneAuthProvider.credential(
          verificationId: smsCodeId, smsCode: smsCode);
      await firebaseAuth.signInWithCredential(credential);
      if (!mounted) {
        return;
      }
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.homeScreen, (route) => false);
    } on FirebaseAuth catch (e) {
      debugPrint(e.toString());
      showAlertDialog(context: context, message: e.toString());
    }
  }

  void sendOtp({
    required BuildContext context,
    required String phone,
  }) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          showAlertDialog(context: context, message: e.toString());
        },
        codeSent: (smsCodeId, resendCodeId) {
           DBHelper.createUser(1);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.otpScreen, (route) => false,
              arguments: {
                "phone": phone,
                "smsCodeId": smsCodeId,
              });
        },
        codeAutoRetrievalTimeout: (String smsCodeId) {},
      );
    } catch (_) {}
  }
}

final authRepositoryProvider =
    Provider((ref) => AuthRepository(firebaseAuth: FirebaseAuth.instance));
