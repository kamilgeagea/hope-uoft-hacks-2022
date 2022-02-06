import 'package:client/constants.dart';
import 'package:client/pages/auth/sign_up.dart';
import 'package:client/widgets/pressable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 100, 15, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Pressable(
                      onTap: () async {
                        if (_formkey.currentState?.validate() ?? false) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          //_authService.signIn(email, password);
                        }
                      },
                      child: const Text("Submit",
                          style: TextStyle(
                              color: kACCENT_COLOR,
                              fontSize: kLARGE_FONT,
                              fontWeight: FontWeight.w600)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Email"),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CupertinoTextField(
                      padding: EdgeInsets.zero,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      onChanged: (val) => setState(() {
                        email = val;
                      }),
                      style: const TextStyle(color: kSECONDARY_TEXT_COLOR),
                      placeholder: "Enter email",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Password"),
                    ),
                    const SizedBox(height: 10.0),
                    CupertinoTextField(
                      obscureText: true,
                      maxLength: 20,
                      onChanged: (val) => setState(() {
                        password = val;
                      }),
                      padding: EdgeInsets.zero,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      placeholder: "Enter password",
                    ),
                    const SizedBox(height: 30.0),
                    Center(
                        child: Pressable(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => const SignUp(),
                                transitionDuration: Duration.zero));
                      },
                      child: const Text(
                        "Sign up instead",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: kACCENT_COLOR),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
