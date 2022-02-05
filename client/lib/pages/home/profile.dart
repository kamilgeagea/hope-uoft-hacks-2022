import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

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
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.pink, fontSize: 18),
                        )),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(),
                  TextButton(
                    onPressed: () {},
                    child: Text("Change Photo"),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Username"),
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
                      child: Text("Email"),
                    ),
                    TextFormField(
                      initialValue: email,
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
                key: _formKey,
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  child: Text("Log Out"),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
