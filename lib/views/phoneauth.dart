
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/helpers/helpers.dart';
import 'package:myapp/views/otp_screen.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 24, 30, 41),
      ),
      backgroundColor: Color.fromARGB(255, 24, 30, 41),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Lottie.asset(
                  'assets/Animation - 1703263987973 (1).json',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Enter Phone Number',
              style: GoogleFonts.montserrat(
                color: Colors.white,
              ),
            ),
            spacingHeight(10),
            TextFormField(
              controller: phoneController,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Enter your number with country code',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Iconsax.mobile),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: Color.fromARGB(255, 30, 38, 52),
                filled: true,
              ),
            ),
            spacingHeight(20),
            Center(
              child: ElevatedButton(
                onPressed: ()async{
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credentia){

                    }, 
                    verificationFailed: (FirebaseAuthException exception){

                    }, 
                    codeSent: (String verificationId, int? forceResendingToken){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OtpScreen(verificationId: verificationId,)));
                    }, 
                    codeAutoRetrievalTimeout: (String verificationId){

                    },
                    phoneNumber: phoneController.text.toString(),
                    );
                }, child: Text('Send request',style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                  backgroundColor:MaterialStatePropertyAll(Colors.amber),
                ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
