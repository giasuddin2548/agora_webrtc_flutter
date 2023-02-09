
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextEditingController controller;
  String name;

  MyTextField(this.controller,this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true, // to trigger disabledBorder
      decoration:  InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF2F2F2),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1,color: Colors.red),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1,color: Colors.orange),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1,color: Colors.green),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1,)
        ),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1,color: Colors.black)
        ),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1,color: Colors.yellowAccent)
        ),
        hintText: name,
        hintStyle: const TextStyle(fontSize: 16,color: Color(0xFFB3B1B1)),
      ),
      controller: controller,
      // onChanged: _authenticationFormBloc.onPasswordChanged,
      obscureText: false,
    );
  }
}
