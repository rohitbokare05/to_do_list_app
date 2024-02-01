// import 'dart:html';

// import 'dart:math';

// ignore_for_file: camel_case_types, prefer_final_fields, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/colors.dart';
import 'package:flutter_application_1/data/auth_data.dart';

// ignore: must_be_immutable
class LogIN_Screen extends StatefulWidget {
  final VoidCallback show;
  const LogIN_Screen(this.show, {super.key});

  @override
  State<LogIN_Screen> createState() => _LogIN_ScreenState();
}

class _LogIN_ScreenState extends State<LogIN_Screen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              image(),
              const SizedBox(
                height: 50,
              ),
              textfield_email(
                  email, _focusNode1, 'enter emailsss', Icons.email),
              const SizedBox(
                height: 20,
              ),
              textfield_email(pass, _focusNode2, 'enter pass', Icons.password),
              New_Sign_Up(),
              const SizedBox(
                height: 10,
              ),
              login_button()
            ],
          ),
        ),
      ),
    );
  }

  Widget New_Sign_Up() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 0),
          child: Text(
            'don\'t have a account ?',
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 26),
          child: GestureDetector(
            onTap: widget.show,
            child: Text(
              'Sign UP',
              style: TextStyle(
                  color: custom_green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget login_button() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: GestureDetector(
        onTap: () {
          AuthenticationRemote().login(email.text, pass.text);
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: custom_green, borderRadius: BorderRadius.circular(20)),
          child: const Center(
            child: Text(
              'Login',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }

  Widget textfield_email(TextEditingController _controller,
      FocusNode _focusNode, String hinttext, IconData icons) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        style: const TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
            focusColor: custom_green,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: custom_green)),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            prefixIcon: Icon(icons),
            hintText: hinttext),
      ),
    );
  }
}

Widget image() {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
              image: AssetImage('images/7.png'), fit: BoxFit.cover)),
      width: double.infinity,
      height: 300,
    ),
  );
}
