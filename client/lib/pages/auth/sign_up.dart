import 'package:client/constants.dart';
import 'package:client/pages/auth/sign_in.dart';
import 'package:client/pages/posts/posts.dart';
import 'package:client/widgets/pressable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  bool isLoading = false;

  String password = "";
  String email = "";
  String passwordTwo = "";

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 100, 15, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Pressable(
                      isLoading: isLoading,
                      onTap: () async {
                        if (_formkey.currentState?.validate() ?? false) {
                          FocusManager.instance.primaryFocus?.unfocus();

                          try {
                            if (password != passwordTwo) {
                              throw Error();
                            }

                            setState(() {
                              isLoading = true;
                            });

                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);

                            setState(() {
                              isLoading = false;
                            });
                            if (newUser != null) {
                              Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, _, __) =>
                                          const Posts(),
                                      transitionDuration: Duration.zero));
                            }
                          } catch (e) {
                            setState(() {
                              isLoading = false;
                            });
                            print(e);
                          }
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
                      height: 10,
                    ),
                    CupertinoTextField(
                      style: const TextStyle(color: kSECONDARY_TEXT_COLOR),
                      padding: EdgeInsets.zero,
                      placeholder: "Enter email",
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      onChanged: (val) => setState(() {
                        email = val;
                      }),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Password"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CupertinoTextField(
                      style: const TextStyle(color: kSECONDARY_TEXT_COLOR),
                      padding: EdgeInsets.zero,
                      placeholder: "Enter password",
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      obscureText: true,
                      maxLength: 20,
                      onChanged: (val) => setState(() {
                        password = val;
                      }),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Confirm Password"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CupertinoTextField(
                      style: const TextStyle(color: kSECONDARY_TEXT_COLOR),
                      padding: EdgeInsets.zero,
                      placeholder: "Enter password confirmation",
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      obscureText: true,
                      maxLength: 20,
                      onChanged: (val) => setState(() {
                        passwordTwo = val;
                      }),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Pressable(
                        child: const Text(
                          "Sign in instead",
                          style: TextStyle(
                            color: kACCENT_COLOR,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, _, __) =>
                                      const SignIn(),
                                  transitionDuration: Duration.zero));
                        })
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
