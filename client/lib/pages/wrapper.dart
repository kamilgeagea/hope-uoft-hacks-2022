import 'package:client/pages/auth/sign_in.dart';
import 'package:client/pages/auth/sign_up.dart';
import 'package:client/pages/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'launch.dart';

//MANAGES STATES SUCH AS AUTHENTICATION AND IF THE USER MOVES TO A DIFFERENT SCREEN, FASTER AND MORE RESPONSIVE
//THAN THE USUAL NAVIGATOR PUSH/PULL
//ONLY DOWNSIDE IS THAT IT DOESN'T PUSH ON TOP OF AND CAN ONLY REPLACE
//SO U CAN'T UNDO ITS MOVEMENT

class Wrapper extends ConsumerWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData.localize(
          ThemeData.dark(),
          TextTheme(
            bodyText1: TextStyle(color: Colors.white, fontSize: 16),
            bodyText2: TextStyle(
              color: Colors.pink,
              fontSize: 22,
            ),
          )),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Profile(),
        '/sign_in': (context) => SignIn(),
        '/sign_up': (context) => SignUp(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
