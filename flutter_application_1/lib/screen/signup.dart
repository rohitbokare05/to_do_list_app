// import 'dart:html';

// import 'dart:math';

// ignore_for_file: camel_case_types, prefer_final_fields, annotate_overrides, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/colors.dart';
import 'package:flutter_application_1/data/auth_data.dart';

class SignUP_screen extends StatefulWidget {
  final VoidCallback show;
  const SignUP_screen(this.show, {super.key});

  @override
  State<SignUP_screen> createState() => _SignUP_screenState();
}

class _SignUP_screenState extends State<SignUP_screen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  final email = TextEditingController();
  final pass = TextEditingController();
  final passconfirm = TextEditingController();

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
              textfield_email(email, _focusNode1, 'enter email', Icons.email),
              const SizedBox(
                height: 10,
              ),
              textfield_email(pass, _focusNode2, 'enter pass', Icons.password),
              const SizedBox(
                height: 10,
              ),
              textfield_email(
                  passconfirm, _focusNode3, 'confirm pass', Icons.password),
              New_Sign_Up(),
              const SizedBox(
                height: 20,
              ),
              Sign_button()
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
            'have a account ?',
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 26),
          child: GestureDetector(
            onTap: widget.show,
            child: Text(
              ' login',
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

  Widget Sign_button() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: GestureDetector(
        onTap: () {
          AuthenticationRemote()
              .register(email.text, pass.text, passconfirm.text);
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: custom_green, borderRadius: BorderRadius.circular(20)),
          child: const Center(
            child: Text(
              'SIGN UP',
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
