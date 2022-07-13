import 'package:firebase_app/bloc/cubit/auth_cubit.dart';
import 'package:firebase_app/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  @override
  Widget build(BuildContext context) {
    print("build");

    // final authCubit = BlocProvider.of<AuthCubit>(context);

    // final authCubit2 = context.read<AuthCubit>();

    return Scaffold(
      // backgroundColor: Colors.black,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          print("state in listner: " + state.toString());
          if (state is AuthError) {
            Fluttertoast.showToast(
              msg: state.errorMessage,
              toastLength: Toast.LENGTH_LONG,
            );
          }

          if (state is AuthSuccess) {
            ////

            Fluttertoast.showToast(msg: "Login Success !!!!");

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => Scaffold(
                            appBar: AppBar(
                          title: Text("Dashboard"),
                        ))),
                (_) => false);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              children: [
                Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView(children: [
                      SizedBox(height: 30),
                      Text(
                        "Hello,",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Welcome back",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
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
                            print("hide password: ");
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
                            // phoneController.text = "+977";

                            if (formKey.currentState != null) {
                              formKey.currentState!.save();
                              bool validated = formKey.currentState!.validate();

                              if (validated == false) {
                                return;
                              }
                              context.read<AuthCubit>().login(
                                  emailController.text,
                                  passwordController.text);

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
                          context.read<AuthCubit>().signInWithFacebook();
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
                          context.read<AuthCubit>().signInWithGoogle();
                        },
                        child: Text(
                          "Sign in with Google",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                      ),

                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SignupScreen()));
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
                if (state is AuthLoading)
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.6),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: Colors.white),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          state.loadingMessage,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    )),
                  )
              ],
            ),
          );
        },
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
