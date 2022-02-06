import 'package:client/constants.dart';
import 'package:client/pages/auth/sign_in.dart';
import 'package:client/pages/auth/sign_up.dart';
import 'package:client/widgets/pressable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Launch extends StatefulWidget {
  const Launch({Key? key}) : super(key: key);

  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 200, 15, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hope",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Make a positive",
              style: TextStyle(
                  color: kACCENT_COLOR,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            const Text(
              "impact",
              style: TextStyle(
                  color: kACCENT_COLOR,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 300,
            ),
            Center(
              child: Column(
                children: [
                  Pressable(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => const SignIn(),
                                transitionDuration: Duration.zero));
                      },
                      child: Container(
                          width: double.infinity,
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              color: kSECONDARY_COLOR,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(fontSize: 18),
                            ),
                          ))),
                  const SizedBox(
                    height: 20,
                  ),
                  Pressable(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => const SignUp(),
                                transitionDuration: Duration.zero));
                      },
                      child: Container(
                          width: double.infinity,
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              color: kSECONDARY_COLOR,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 18),
                            ),
                          ))
                      // style: ButtonStyle(
                      //     backgroundColor:
                      //         MaterialStateProperty.all<Color?>(Colors.grey[800]),
                      //     padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      //       const EdgeInsets.symmetric(
                      //           vertical: 15, horizontal: 60),
                      //     ),
                      //     shape: MaterialStateProperty.all<OutlinedBorder>(
                      //         RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(16)))),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
