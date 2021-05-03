import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/main.dart';
import 'package:hive/pages/refactorPg.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn mygSignIn = GoogleSignIn();

class HomePage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  bool isSignedIn = false;

// this is for sign in  -------------------------------------------------------------------------------------
  void initState() {
    super.initState();
    mygSignIn.onCurrentUserChanged.listen((mygSignInAccount) {
      controlSignIn(mygSignInAccount);
    }, onError: (mygError) {
      print("Error Message:" + mygError);
    });

    mygSignIn.signInSilently(suppressErrors: false).then((mygSignInAccount) {
      controlSignIn(mygSignInAccount);
    }).catchError((gError) {
      print("Error :" + gError);
    });
  }

  controlSignIn(GoogleSignInAccount signInAccount) async {
    if (signInAccount != null) {
      setState(() {
        isSignedIn = true;
      });
    } else {
      setState(() {
        isSignedIn = false;
      });
    }
  }

  loginUser() {
    mygSignIn.signIn();
  }
//upper part is sign in----------------------------------------------------------------------------------------

  logoutUser() {
    mygSignIn.signOut();
  }

  Widget buildHomeScreen() {
    return RaisedButton.icon(
        onPressed: loginUser, icon: Icon(Icons.close), label: Text("Sign Out"));
  }

  Scaffold buildSignInScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).accentColor,
              Theme.of(context).primaryColor
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Buzzclip   ',
              style: TextStyle(
                fontFamily: '     Lobster',
                fontSize: 90,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 15),
            SignInOptionButton(
              myFunction: loginUser,
              myImages: "assets/images/google_signin_button.png",
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isSignedIn) {
      return buildSignInScreen();
    } else {
      return buildSignInScreen();
    }
  }
}
