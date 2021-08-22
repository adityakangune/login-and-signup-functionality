import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_new/screens/auth_page.dart';
import 'google_signup_button_widget.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/background.png"),
                  fit: BoxFit.fill
                )
            ),
          ),
          buildSignUp(context),
        ],
      );

  Widget buildSignUp(BuildContext context) =>
      Container(
        child: Column(
          children: [
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 0, 20),
                  child: Text(
                    'Welcome.',
                    style: GoogleFonts.sacramento(
                              color: Colors.black,
                              fontSize:80,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2
                          ),
                    ),
                ),
              ],
            ),
            Text('Login to continue',
                  style: GoogleFonts.montserrat(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
            ),
            SizedBox(height: 40),
            OutlinedButton.icon(
              icon: Icon(
                Icons.email_rounded,
                color: HexColor("e3386a"),
              ),
              label: Text('Sign In',
                style: GoogleFonts.montserrat(
                  letterSpacing: 2,
                  fontSize: 20,
                ),
              ),
              style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  side: BorderSide(
                    color: HexColor("e3386a"),
                    style: BorderStyle.solid,
                    width: 4
                ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: StadiumBorder(),
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AuthPage()),
              ),
            ),
            SizedBox(height: 12),
            GoogleSignupButtonWidget(),
          ],
        ),
      );
}
