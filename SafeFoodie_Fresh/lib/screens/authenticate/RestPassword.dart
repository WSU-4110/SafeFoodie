// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RestPassword extends StatefulWidget {
  const RestPassword({Key? key}) : super(key: key);

  @override
  State<RestPassword> createState() => _RestPasswordState();
}

class _RestPasswordState extends State<RestPassword> {
  late String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff251f34),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff251f34),
      ),
      // Removed Unnecessary Container
     body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
              ),
              // added const
             const SizedBox(
                height: 30,
              ),
              // addedconst 
             const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13),
                ),
              ),
              // added const 
             const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.white,
                  //added const 
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      fillColor: const Color(0xff3B324E),
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff14dae2), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      )),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
              ),
              // added const
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email)
                            .then((value) => Navigator.of(context).pop());
                      },
                      //added const 
                      child: const Text('Send Request')))
            ]),
      ),
    );
  }
}
