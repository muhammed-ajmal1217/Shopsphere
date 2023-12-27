import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/helpers/helpers.dart';
import 'package:myapp/views/home.dart';

class OtpScreen extends StatefulWidget {
  String verificationId;
  OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 30, 41),
      body: Column(children: [
        spacingHeight(70),
        Align(
          alignment: Alignment.center,
          child: Container(
            child: Lottie.asset(
              'assets/Animation - 1703265851950.json',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: Text('OTP'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Color.fromARGB(255, 30, 38, 52),
              filled: true,
            ),
          ),
        ),
        spacingHeight(20),
        Center(
          child: ElevatedButton(
            onPressed: () async {
              try {
                PhoneAuthCredential credential =
                    await PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: otpController.text.toString());
                        FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HomePage()));
                        });
              } catch (error) {
                print('while phone authentication : ${error}');
              }
            },
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue),
            ),
          ),
        )
      ]),
    );
  }
}
