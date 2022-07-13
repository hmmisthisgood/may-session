import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  login(String email, String password) async {
    print("fireabse  login");

    try {
      emit(AuthLoading(loadingMessage: "Signing In...")); //1
      await Future.delayed(Duration(seconds: 3), () {
        print("i am delayed");
      });

      emit(AuthLoading(loadingMessage: "Verifying your crednetails...")); //2
      await Future.delayed(Duration(seconds: 3), () {
        print("i am delayed");
      });

      emit(AuthLoading(loadingMessage: "Oh noooo eror...")); //3
      emit(AuthLoading(loadingMessage: "Finalizing...")); //4

      final UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(AuthSuccess(user: credential.user));
      print(credential.toString());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(
        errorMessage: e.message ?? "An error occureed while signing in",
      ));
      print(e.message);
    } catch (e) {
      print(e);
      emit(AuthError(
        errorMessage: "An error occureed while signing in",
      ));
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
    emit(AuthLoading(loadingMessage: "Signing In With Google..."));

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

      emit(AuthSuccess(user: credentails.user));

      print(credentails.toString());
    } catch (e) {
      print(e);
      emit(AuthError(
        errorMessage: "An error occureed while signing in",
      ));
    }
  }

  signInWithFacebook() async {
    emit(AuthLoading(loadingMessage: "Signing In With Facebook..."));

    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;

        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.token);

        final credentials = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        emit(AuthSuccess(user: credentials.user));
      } else {
        emit(AuthError(
          errorMessage: result.message ?? "An error occurred",
        ));
        print(result.status);
        print(result.message);
      }
    } catch (e) {
      emit(AuthError(
        errorMessage: "An error occurred",
      ));
    }
  }

  signup(String email, String password) async {
    emit(AuthLoading(loadingMessage: "Creating your account..."));

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential.toString());
      emit(AuthSuccess(user: credential.user));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }

      emit(AuthError(
        errorMessage: e.message ?? "An error occureed while signing in",
      ));
    } catch (e) {
      print(e);
      emit(AuthError(
        errorMessage: "An error occurred",
      ));
    }
  }
}
