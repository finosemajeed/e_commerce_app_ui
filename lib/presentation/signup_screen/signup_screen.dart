import 'package:e_comerce_app_ui/domain/exceptions/messeged_firebaseauth_exception.dart';
import 'package:e_comerce_app_ui/domain/exceptions/signup_exception.dart';
import 'package:e_comerce_app_ui/infrastructure/authentication/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  var regKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 4),
                const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Create an Account, its free',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const SizedBox(height: 40),
                Form(
                  key: regKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        controller: userNameController,
                        decoration: const InputDecoration(
                          hintText: 'username@example.com',
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.black,
                          ),
                          labelText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a username';
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.black,
                            ),
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty || !(value.contains('@'))) {
                              return 'Enter a valid username include \'@\'';
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.black,
                          ),
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                        ),
                        textInputAction: TextInputAction.done,
                        controller: passwordContoller,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Password must be greater than 6';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: const Size(250, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () {
                          // final isValid = regKey.currentState!.validate();
                          // final email = emailController.text.trim();
                          // final password = passwordContoller.text.trim();
                          // final userName = userNameController.text.trim();
                          // if (isValid) {
                          //   SignupAuthFunction.signupUser(
                          //       email, password, userName, context);
                          //   Navigator.of(context).pop();
                          // }
                          signUpButtonCallback(context);
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    const Text('Already have an account?',
                        style: TextStyle(color: Colors.blue)),
                    GestureDetector(
                      onTap: (() => Navigator.of(context)
                          .pushReplacementNamed('/login_screen')),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUpButtonCallback(BuildContext context) async {
    if (regKey.currentState!.validate()) {
      // goto complete profile page
      final AuthentificationService authService = AuthentificationService();
      bool signUpStatus = false;
      String? snackbarMessage;
      try {
        final signUpFuture = authService.signUp(
            email: emailController.text.trim(),
            password: passwordContoller.text.trim(),
            userName: userNameController.text.trim());
        signUpFuture.then((value) => signUpStatus = value);
        signUpStatus = await showDialog(
          context: context,
          builder: (context) {
            return FutureProgressDialog(
              signUpFuture,
              message: const Text("Creating new account"),
            );
          },
        );
        if (signUpStatus == true) {
          snackbarMessage =
              "Registered successfully, Please verify your email id";
        } else {
          throw FirebaseSignUpAuthUnknownReasonFailureException();
        }
      } on MessagedFirebaseAuthException catch (e) {
        snackbarMessage = e.message;
      } catch (e) {
        snackbarMessage = e.toString();
      } finally {
        // Logger().i(snackbarMessage);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(snackbarMessage.toString()),
          ),
        );
        if (signUpStatus == true) {
          Navigator.pop(context);
        }
      }
    }
  }
}
