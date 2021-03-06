import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_new/provider/googleSigninProvider.dart';
import 'package:login_new/widget/logged_in_widget.dart';
import 'package:login_new/widget/sign_up_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final provider = Provider.of<GoogleSignInProvider>(context);

        if (provider.isSigningIn) {
          return buildLoading();
        } else if (snapshot.hasData) {
          return LoggedInWidget();
        } else {
          return SignUpWidget();
        }
      },
    ),
  );

  Widget buildLoading() => Stack(
    fit: StackFit.expand,
    children: [
      Center(child: CircularProgressIndicator()),
    ],
  );
}
