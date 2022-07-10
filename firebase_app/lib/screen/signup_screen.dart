import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/common_text_field.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  bool hidePassword = true;
  signup() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
    } catch (e) {
      print(e);
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
                "Welcome to our app",
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
                    signup();

                    /// sign in user from firebase
                  }
                },
                child: Text(
                  "REGISTER",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              )
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
