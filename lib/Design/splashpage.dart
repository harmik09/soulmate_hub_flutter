import 'package:flutter/material.dart';
import 'package:matrimony/Design/utils/colors.dart';

import 'dashboard.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3), () {
      // Navigate to another page after delay (e.g., HomePage)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),  // Replace HomePage() with your target screen
      );
    });

    return Scaffold(
      backgroundColor: THEMECOLOR,
      body: Center(
        // child: Text('Demo'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Logo.png'),
          ],
        ),
      ),
    );
  }
}



