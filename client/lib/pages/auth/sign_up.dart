import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  String username = "";
  String password = "";
  String email = "";
  String passwordTwo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 100, 50, 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sign up",
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
                        child: Text("Email"),
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Enter email"),
                        validator: (value) => ((value?.isEmpty ?? true) ||
                                !(value ?? '').contains(new RegExp(r'[@]'))
                            ? 'Please enter a valid email address'
                            : null),
                        onChanged: (val) => setState(() {
                          email = val;
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
                        validator: (value) => ((value?.isEmpty ?? true) ||
                                (value?.length ?? 1) < 7 ||
                                !(value ?? '').contains(new RegExp(r'[0-9]')))
                            ? (value?.length ?? 1) < 7
                                ? 'Ensure your password is at least 7 characters.'
                                : 'Please ensure your password contains a numeric digit.'
                            : ((value?.length ?? 1) > 20)
                                ? 'Your password cannot be longer than 20 characters'
                                : null,
                        obscureText: true,
                        maxLength: 20,
                        onChanged: (val) => setState(() {
                          password = val;
                        }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Confirm Password"),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter password confirmation"),
                        validator: (value) => ((value?.isEmpty ?? true) ||
                                ((value ?? "0") != password))
                            ? 'Please ensure your two passwords match.'
                            : null,
                        obscureText: true,
                        maxLength: 20,
                        onChanged: (val) => setState(() {
                          passwordTwo = val;
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
