import 'package:firebase_app/screen/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/common_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  bool hidePassword = true;

  login() async {
    print("fireabse  login");

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print(credential.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      print(e.message);
    } catch (e) {
      print(e);
    }
  }

  updateUser() async {
    await FirebaseAuth.instance.currentUser
        ?.updateDisplayName("i AM COOL"); //2 seconds

    await FirebaseAuth.instance.currentUser
        ?.updateEmail("aa@bb.com"); // 3 seconds
    // FirebaseAuth.instance.currentUser?.updatePassword(displayName);
    // FirebaseAuth.instance.currentUser?.updatePhoneNumber(displayName);
    await FirebaseAuth.instance.currentUser?.updatePhotoURL(// 5 seconds
        "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Gull_portrait_ca_usa.jpg/450px-Gull_portrait_ca_usa.jpg");

    print(FirebaseAuth.instance.currentUser);
  }

  signInWithGoogle() async {
    // print(FirebaseAuth.instance.currentUser);

    try {
      await FirebaseAuth.instance.signOut();

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final credentails =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print(credentails.toString());
    } catch (e) {
      print(e);
    }
  }

  signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken.token);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } else {
      print(result.status);
      print(result.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(children: [
              SizedBox(height: 30),
              Text(
                "Hello,",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Welcome back",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 60),

              CommonTextField(
                // autovalidateMode: AutovalidateMode.always,
                controller: emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {
                  print(val);
                },
                onFieldSubmitted: (val) {
                  print("Submitted value: $val");
                },

                validator: (value) {
                  if (value == null) {
                    return "Email is required";
                  }
                  if (value.isEmpty) {
                    return "Email must not be empty";
                  }
                  return null;
                },
                hintText: "a@b.com",
                prefixIcon: Icon(Icons.email),
              ),
              // CommonTextField(
              //   // autofocus: true,
              //   controller: phoneController,
              //   textInputAction: TextInputAction.next,
              //   keyboardType: TextInputType.number,
              //   maxLines: 1,
              //   hintText: "Enter your phone number",
              //   prefixIcon: Icon(Icons.phone),
              // ),
              CommonTextField(
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: hidePassword,
                controller: passwordController,
                validator: (value) {
                  if (value == null) {
                    return "Password is required";
                  }

                  if (value.isEmpty) {
                    return "Password cannot be empty";
                  }
                  if (value.length < 6) {
                    return "Passwored length must be >6";
                  }
                  return null;
                },
                hintText: "Enter your password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: InkWell(
                  onTap: () {
                    hidePassword = !hidePassword;
                    setState(() {});
                    print("hide password: $hidePassword");
                  },
                  child: Icon(
                    hidePassword == true
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              MaterialButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();

                    // final phone = phoneController.text;
                    // phoneController.text = "+977$phone";

                    if (formKey.currentState != null) {
                      formKey.currentState!.save();
                      bool validated = formKey.currentState!.validate();

                      if (validated == false) {
                        return;
                      }
                      login();

                      /// sign in user from firebase
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green),

              MaterialButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  signInWithFacebook();
                },
                child: Text(
                  "Sign in with Facebook",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xff4267B2),
              ),
              MaterialButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  signInWithGoogle();
                },
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),

              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SignupScreen()));
                  },
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                      color: Colors.black87,
                      // decoration: TextDecoration.underline,
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}

///SafeArea = protects the ui from hardware
///

/// form and textfield
/// 1. TextField
/// 2. TextFormField
/// 3. Form
