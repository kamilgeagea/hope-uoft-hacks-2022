import 'package:client/pages/launch.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

//NOTES SO NOONE FORGETS
//need to connect this to backend
//supposed to retrieve user info earlier in program and then this
//is supposed to listen to the stream and take a snapshot of it
//it updates the 4 strings with the snapshot values

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  String username = "";
  String email = "";
  String password = "";
  String passwordTwo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 75, 30, 50),
          child: Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Profile",
                      style: TextStyle(fontSize: 45),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      //SAVE BUTTON
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          //_authService.signIn(email, password);
                        }
                      },
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Save",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.pink),
                          )),
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Change Photo",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Username",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    TextFormField(
                      initialValue: username,
                      decoration: InputDecoration(
                        hintText: "Please enter your new username",
                      ),
                      validator: (value) => (value?.isEmpty ?? true)
                          ? "Please enter your new username"
                          : null,
                      onChanged: (val) => setState(() {
                        username = val;
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    TextFormField(
                      initialValue: email,
                      decoration:
                          InputDecoration(hintText: "Enter your new email"),
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
                      child: Text(
                        "Password",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: "Enter your new password"),
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
                      //maxLength: 20,
                      onChanged: (val) => setState(() {
                        password = val;
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Confirm Password",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter password confirmation"),
                      validator: (value) => ((value?.isEmpty ?? true) ||
                              ((value ?? "0") != password))
                          ? 'Please ensure your two passwords match.'
                          : null,
                      obscureText: true,
                      //maxLength: 20,
                      onChanged: (val) => setState(() {
                        passwordTwo = val;
                      }),
                    ),
                  ],
                ),
                key: _formKey,
              ),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  child: Text(
                    "Log Out",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.pink),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Launch()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
