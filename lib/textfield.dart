import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  const TextFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 400,
          width: 300,
          color: Colors.black,
          padding: const EdgeInsets.all(16),
          child: const Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    label: Text('Username'),
                    prefixIcon: Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
              )
            ],
          )),
    );
  }
}
