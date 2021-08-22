import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_new/provider/googleSigninProvider.dart';
import 'package:provider/provider.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child:




        OutlinedButton.icon(
          icon: FaIcon(FontAwesomeIcons.google, color: HexColor("e3386a")),
          label: Text('Sign In With Google',
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
          onPressed: () {
            final provider =Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
            },
          ),
        );
}

