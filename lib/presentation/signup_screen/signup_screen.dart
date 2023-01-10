import 'package:e_comerce_app_ui/presentation/login_screen/login_screen.dart';
import 'package:e_comerce_app_ui/presentation/navigation_screen/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../domain/signup_screen/signup_auth_function.dart';

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
                          final isValid = regKey.currentState!.validate();
                          final email = emailController.text.trim();
                          final password = passwordContoller.text.trim();
                          final userName = userNameController.text.trim();
                          if (isValid) {
                            SignupAuthFunction.signupUser(
                                email, password, userName, context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        NavigationScreen())));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Registration succesfull!'),
                              ),
                            );
                          }
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
                      onTap: (() => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: ((context) => LoginScreen())))),
                      child: Text(
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
}
