import 'package:login_new/provider/emailSignInProvider.dart';
import 'package:login_new/provider/googleSigninProvider.dart';
import 'package:login_new/screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn';

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
      ChangeNotifierProvider(create: (context) => EmailSignInProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    ),
  );
}
