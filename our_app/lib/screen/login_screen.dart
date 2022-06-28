import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_app/screen/page_view_screen.dart';
import 'package:our_app/screen/profile_screen.dart';
import 'package:our_app/utils/shared_pref.dart';
import 'package:our_app/widget/common_text_field.dart';

import '../navigation/routes.dart';
import 'ig_screen_with_tabbar.dart';

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
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              TextFormField(
                // autovalidateMode: AutovalidateMode.always,
                controller: emailController,
                cursorColor: Colors.red,
                cursorHeight: 25,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                style: TextStyle(color: Colors.cyan),
                onChanged: (val) {
                  print(val);
                },
                onFieldSubmitted: (val) {
                  print("Submitted value: $val");
                },
                onTap: () {
                  print("I am tapped");
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
                decoration: InputDecoration(
                  fillColor: Colors.yellow,
                  focusColor: Colors.brown,
                  hintText: "a@b.com",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.email),

                  border: OutlineInputBorder(), // UnderlineInputBorder,
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow)),
                ),
              ),
              TextField(
                // autofocus: true,
                controller: phoneController,
                cursorColor: Colors.red,
                cursorHeight: 25,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                maxLength: 10,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Enter your phone number",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 250, 187, 187)),
                  prefixIcon: Icon(Icons.phone),
                  // border: InputBorder.none,
                ),
              ),
              TextFormField(
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: hidePassword,
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
                decoration: InputDecoration(
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
              ),
              SizedBox(height: 10),
              Divider(),
              Text("Refactored widgets"),
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
              CommonTextField(
                // autofocus: true,
                controller: phoneController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                maxLines: 1,
                hintText: "Enter your phone number",
                prefixIcon: Icon(Icons.phone),
              ),
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
                onPressed: () {
                  FocusScope.of(context).unfocus();

                  // final phone = phoneController.text;
                  // phoneController.text = "+977$phone";

                  if (formKey.currentState != null) {
                    formKey.currentState!.save();
                    bool validated = formKey.currentState!.validate();
                  }

                  /// Navigation/routing

                  // MaterialPageRoute
                  // CupertinoPageRoute

                  final route =
                      MaterialPageRoute(builder: (_) => IgProfileScreen());

                  // Navigator.push(context, route);

                  // Navigator.pushReplacement(context, route);
                  Navigator.pushNamed(context, Routes.dashboard);
                  SharedPref.setHasUserLoggedIn(true);
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   route,
                  //   (route) {
                  //     return false;
                  //   },
                  // );
                },
                child: Text("Login"),
                color: Colors.green,
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
