import 'dart:async';
import 'package:e_comerce_app_ui/domain/exceptions/credential_actions_exception.dart';
import 'package:e_comerce_app_ui/domain/exceptions/messeged_firebaseauth_exception.dart';
import 'package:e_comerce_app_ui/domain/exceptions/reauth_exceptions.dart';
import 'package:e_comerce_app_ui/domain/exceptions/signin_exception.dart';
import 'package:e_comerce_app_ui/domain/exceptions/signup_exception.dart';
import 'package:e_comerce_app_ui/infrastructure/user_helper/user_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthentificationService {
  // ignore: constant_identifier_names
  static const String USER_NOT_FOUND_EXCEPTION_CODE = "user-not-found";
  // ignore: constant_identifier_names
  static const String WRONG_PASSWORD_EXCEPTION_CODE = "wrong-password";
  // ignore: constant_identifier_names
  static const String TOO_MANY_REQUESTS_EXCEPTION_CODE = 'too-many-requests';
  // ignore: constant_identifier_names
  static const String EMAIL_ALREADY_IN_USE_EXCEPTION_CODE =
      "email-already-in-use";
  // ignore: constant_identifier_names
  static const String OPERATION_NOT_ALLOWED_EXCEPTION_CODE =
      "operation-not-allowed";
  // ignore: constant_identifier_names
  static const String WEAK_PASSWORD_EXCEPTION_CODE = "weak-password";
  // ignore: constant_identifier_names
  static const String USER_MISMATCH_EXCEPTION_CODE = "user-mismatch";
  // ignore: constant_identifier_names
  static const String INVALID_CREDENTIALS_EXCEPTION_CODE = "invalid-credential";
  // ignore: constant_identifier_names
  static const String INVALID_EMAIL_EXCEPTION_CODE = "invalid-email";
  // ignore: constant_identifier_names
  static const String USER_DISABLED_EXCEPTION_CODE = "user-disabled";
  // ignore: constant_identifier_names
  static const String INVALID_VERIFICATION_CODE_EXCEPTION_CODE =
      "invalid-verification-code";
  // ignore: constant_identifier_names
  static const String INVALID_VERIFICATION_ID_EXCEPTION_CODE =
      "invalid-verification-id";
  // ignore: constant_identifier_names
  static const String REQUIRES_RECENT_LOGIN_EXCEPTION_CODE =
      "requires-recent-login";
  // ignore: constant_identifier_names

  FirebaseAuth? _firebaseAuth;

  AuthentificationService._privateConstructor();
  static final AuthentificationService _instance =
      AuthentificationService._privateConstructor();

  FirebaseAuth? get firebaseAuth {
    _firebaseAuth ??= FirebaseAuth.instance;
    return _firebaseAuth;
  }

  factory AuthentificationService() {
    return _instance;
  }

  Stream<User?> get authStateChanges => firebaseAuth!.authStateChanges();

  Stream<User?> get userChanges => firebaseAuth!.userChanges();

  Future<void> deleteUserAccount() async {
    await currentUser!.delete();
    await signOut();
  }

  Future<bool> reauthCurrentUser(password) async {
    try {
      UserCredential userCredential = await firebaseAuth!
          .signInWithEmailAndPassword(
              email: currentUser!.email!, password: password);
      userCredential = await currentUser!
          .reauthenticateWithCredential(userCredential.credential!);
    } on FirebaseAuthException catch (e) {
      if (e.code == WRONG_PASSWORD_EXCEPTION_CODE) {
        throw FirebaseSignInAuthWrongPasswordException();
      } else {
        throw FirebaseSignInAuthException(message: e.code);
      }
    } catch (e) {
      throw FirebaseReauthUnknownReasonFailureException(message: e.toString());
    }
    return true;
  }

  Future<bool> signIn({String? email, String? password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth!
          .signInWithEmailAndPassword(email: email!, password: password!);
      if (userCredential.user!.emailVerified) {
        return true;
      } else {
        await userCredential.user!.sendEmailVerification();
        throw FirebaseSignInAuthUserNotVerifiedException();
      }
    } on MessagedFirebaseAuthException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case INVALID_EMAIL_EXCEPTION_CODE:
          throw FirebaseSignInAuthInvalidEmailException();

        case USER_DISABLED_EXCEPTION_CODE:
          throw FirebaseSignInAuthUserDisabledException();

        case USER_NOT_FOUND_EXCEPTION_CODE:
          throw FirebaseSignInAuthUserNotFoundException();

        case WRONG_PASSWORD_EXCEPTION_CODE:
          throw FirebaseSignInAuthWrongPasswordException();

        case TOO_MANY_REQUESTS_EXCEPTION_CODE:
          throw FirebaseTooManyRequestsException();

        default:
          throw FirebaseSignInAuthException(message: e.code);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> signUp(
      {String? email, String? password, String? userName}) async {
    try {
      final UserCredential userCredential = await firebaseAuth!
          .createUserWithEmailAndPassword(email: email!, password: password!);

      final String uid = userCredential.user!.uid;
      if (userCredential.user!.emailVerified == false) {
        await userCredential.user!.sendEmailVerification();
      }
      await UserDatabaseHelper().createNewUser(uid, userName!, email);
      return true;
    } on MessagedFirebaseAuthException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case EMAIL_ALREADY_IN_USE_EXCEPTION_CODE:
          throw FirebaseSignUpAuthEmailAlreadyInUseException();
        case INVALID_EMAIL_EXCEPTION_CODE:
          throw FirebaseSignUpAuthInvalidEmailException();
        case OPERATION_NOT_ALLOWED_EXCEPTION_CODE:
          throw FirebaseSignUpAuthOperationNotAllowedException();
        case WEAK_PASSWORD_EXCEPTION_CODE:
          throw FirebaseSignUpAuthWeakPasswordException();
        default:
          throw FirebaseSignInAuthException(message: e.code);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await firebaseAuth!.signOut();
  }

  bool get currentUserVerified {
    currentUser!.reload();
    return currentUser!.emailVerified;
  }

  Future<void> sendVerificationEmailToCurrentUser() async {
    await firebaseAuth!.currentUser!.sendEmailVerification();
  }

  User? get currentUser {
    return firebaseAuth!.currentUser;
  }

  Future<void> updateCurrentUserDisplayName(String updatedDisplayName) async {
    await currentUser!.updateDisplayName(updatedDisplayName);
  }

  Future<bool> resetPasswordForEmail(String email) async {
    try {
      await firebaseAuth!.sendPasswordResetEmail(email: email);
      return true;
    } on MessagedFirebaseAuthException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      if (e.code == USER_NOT_FOUND_EXCEPTION_CODE) {
        throw FirebaseCredentialActionAuthUserNotFoundException();
      } else {
        throw FirebaseCredentialActionAuthException(message: e.code);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> changePasswordForCurrentUser(
      {String? oldPassword, required String newPassword}) async {
    try {
      bool isOldPasswordProvidedCorrect = true;
      if (oldPassword != null) {
        isOldPasswordProvidedCorrect =
            await verifyCurrentUserPassword(oldPassword);
      }
      if (isOldPasswordProvidedCorrect) {
        await firebaseAuth!.currentUser!.updatePassword(newPassword);

        return true;
      } else {
        throw FirebaseReauthWrongPasswordException();
      }
    } on MessagedFirebaseAuthException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case WEAK_PASSWORD_EXCEPTION_CODE:
          throw FirebaseCredentialActionAuthWeakPasswordException();
        case REQUIRES_RECENT_LOGIN_EXCEPTION_CODE:
          throw FirebaseCredentialActionAuthRequiresRecentLoginException();
        default:
          throw FirebaseCredentialActionAuthException(message: e.code);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> changeEmailForCurrentUser(
      {String? password, String? newEmail}) async {
    try {
      bool isPasswordProvidedCorrect = true;
      if (password != null) {
        isPasswordProvidedCorrect = await verifyCurrentUserPassword(password);
      }
      if (isPasswordProvidedCorrect) {
        await currentUser!.verifyBeforeUpdateEmail(newEmail!);

        return true;
      } else {
        throw FirebaseReauthWrongPasswordException();
      }
    } on MessagedFirebaseAuthException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      throw FirebaseCredentialActionAuthException(message: e.code);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> verifyCurrentUserPassword(String password) async {
    try {
      final AuthCredential authCredential = EmailAuthProvider.credential(
        email: currentUser!.email!,
        password: password,
      );

      final authCredentials =
          await currentUser!.reauthenticateWithCredential(authCredential);
      // ignore: unnecessary_null_comparison
      return authCredentials != null;
    } on MessagedFirebaseAuthException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case USER_MISMATCH_EXCEPTION_CODE:
          throw FirebaseReauthUserMismatchException();
        case USER_NOT_FOUND_EXCEPTION_CODE:
          throw FirebaseReauthUserNotFoundException();
        case INVALID_CREDENTIALS_EXCEPTION_CODE:
          throw FirebaseReauthInvalidCredentialException();
        case INVALID_EMAIL_EXCEPTION_CODE:
          throw FirebaseReauthInvalidEmailException();
        case WRONG_PASSWORD_EXCEPTION_CODE:
          throw FirebaseReauthWrongPasswordException();
        case INVALID_VERIFICATION_CODE_EXCEPTION_CODE:
          throw FirebaseReauthInvalidVerificationCodeException();
        case INVALID_VERIFICATION_ID_EXCEPTION_CODE:
          throw FirebaseReauthInvalidVerificationIdException();
        default:
          throw FirebaseReauthException(message: e.code);
      }
    } catch (e) {
      rethrow;
    }
  }
}
