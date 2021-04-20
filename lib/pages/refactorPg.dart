import 'package:flutter/material.dart';

class SignInOptionButton extends StatelessWidget {
  SignInOptionButton({this.myImages, this.myFunction});

  final String myImages;
  final Function myFunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myFunction,
      child: Container(
        width: 270.0,
        height: 65.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(myImages),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// AssetImage(
// "assets/images/google_signin_button.png",
// ),
