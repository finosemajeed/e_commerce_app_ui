import 'package:e_comerce_app_ui/domain/exceptions/messeged_firebaseauth_exception.dart';
import 'package:e_comerce_app_ui/domain/exceptions/signin_exception.dart';
import 'package:e_comerce_app_ui/infrastructure/authentication/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool signInStatus = false;
  @override
  Widget build(BuildContext context) {
    bool viewPassword = true;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 4),
                const Text(
                  'Please login to continue,',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'username@example.com',
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Colors.black,
                    ),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      if (!(text.contains('@'))) {
                        return 'Please check your Email';
                      }
                      return "Please enter your Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordContoller,
                  textInputAction: TextInputAction.done,
                  obscuringCharacter: '*',
                  obscureText: viewPassword,
                  decoration: InputDecoration(
                      suffixIconColor: Colors.black,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (viewPassword) {
                                viewPassword = false;
                              } else {
                                viewPassword = true;
                              }
                            });
                          },
                          icon: Icon(viewPassword == true
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      hintText: '**********',
                      prefixIcon: const Icon(
                        Icons.password,
                        color: Colors.black,
                      ),
                      labelText: 'Password',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      )),
                  validator: (text) {
                    if (text!.isEmpty || text.length < 6) {
                      return 'Please check your user name and password!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    final isValid = formkey.currentState!.validate();
                    // bool signInStatus = false;
                    if (isValid) {
                      // final email = emailController.text.trim();
                      // final password = passwordContoller.text.trim();

                      // final isLogged = AuthentificationService()
                      //     .signIn(email: email, password: password);
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return FutureProgressDialog(
                      //       isLogged,
                      //       message: const Text("Signing in to account"),
                      //       // onError: (e) {
                      //       //   snackbarMessage = e.toString();
                      //       // },
                      //     );
                      //   },
                      // );
                      signInButtonCallback();
                      // LoginAuthFunction.signInUser(email, password, context);
                      // if (signInStatus == true) {
                      //   Navigator.of(context)
                      //       .pushReplacementNamed('/main_screen');
                      // }
                    } else {
                      Fluttertoast.showToast(msg: 'Login failed!');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  // ButtonStyle(
                  //     minimumSize: MaterialStateProperty.all(const Size(250, 40)),
                  //     backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signup_screen');
                    },
                    child: const Text('Not a User ? Register'))
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Future<void> signInButtonCallback() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      final AuthentificationService authService = AuthentificationService();

      String? snackbarMessage;
      try {
        final signInFuture = authService.signIn(
          email: emailController.text.trim(),
          password: passwordContoller.text.trim(),
        );
        //signInFuture.then((value) => signInStatus = value);
        signInStatus = await showDialog(
          context: context,
          builder: (context) {
            return FutureProgressDialog(
              signInFuture,
              message: const Text("Signing in to account"),
              // onError: (e) {
              //   snackbarMessage = e.toString();
              // },
            );
          },
        );
        if (signInStatus == true) {
          snackbarMessage = "Signed In Successfully";
        } else {
          if (snackbarMessage == null) {
            throw FirebaseSignInAuthUnknownReasonFailure();
          } else {
            throw FirebaseSignInAuthUnknownReasonFailure(
                message: snackbarMessage);
          }
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
      }
    }
  }
}
