import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(50, 100, 50, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () async {
                        if (_formkey.currentState?.validate() ?? false) {
                          //_authService.signIn(email, password);
                        }
                      },
                      child: Text("Done",
                          style: TextStyle(color: Colors.pink, fontSize: 18)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Username"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Enter username"),
                      validator: (value) => ((value?.isEmpty ?? true)
                          ? 'Please enter your username'
                          : null),
                      onChanged: (val) => setState(() {
                        username = val;
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Password"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Enter password"),
                      validator: (value) => ((value?.isEmpty ?? true)
                          ? 'Please enter your password'
                          : null),
                      obscureText: true,
                      maxLength: 20,
                      onChanged: (val) => setState(() {
                        password = val;
                      }),
                    ),
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
