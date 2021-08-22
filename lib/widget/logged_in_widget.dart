import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_new/provider/googleSigninProvider.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/logged_in.png"),
          fit: BoxFit.fill,
        )
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
        child: Card(
          color: Colors.transparent,
          // margin: EdgeInsets.symmetric(horizontal: 60, vertical: 60),
          shape: StadiumBorder(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:20, horizontal:10),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text('Logged in',
                  style: GoogleFonts.montserrat(
                    letterSpacing: 2,
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 17),
                if (user.photoURL != null)
                  CircleAvatar(
                    maxRadius: 64,
                    backgroundImage: NetworkImage(user.photoURL!),
                  ),
                SizedBox(height: 50),
                if (user.displayName != null)
                  Text('Name: ' + user.displayName!,
                    style: GoogleFonts.montserrat(
                        letterSpacing: 2,
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                if(user.displayName == null)
                  SizedBox(height: 100,),

                SizedBox(height: 20),
                Text('Email: ' + user.email!,
                  style: GoogleFonts.montserrat(
                      letterSpacing: 0.5,
                      fontSize: 18,
                      color: Colors.white
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: HexColor("e3386a"),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(40),
                    // ),
                  ),
                  onPressed: () {
                    final provider =
                        Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.logout();
                  },
                  child: Text('Logout',
                    style: GoogleFonts.montserrat(
                        letterSpacing: 2,
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
