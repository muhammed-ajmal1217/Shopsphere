
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/helpers/helpers.dart';
import 'package:myapp/views/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 16, 34),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            spacingHeight(80),
            Center(child: Icon(Iconsax.security_safe,color: Colors.white,size: 60,)),
            spacingHeight(10),
            Text('Welcome',style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
            Text('Please enter your e-mail and password to Login',style: GoogleFonts.montserrat(color: const Color.fromARGB(255, 190, 189, 189),fontSize: 12),),
            spacingHeight(30),
            textFormField(controller: nameController,text: 'Email'),
            spacingHeight(30),
            textFormField(controller: nameController,text: 'Password'),
            spacingHeight(15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Forgot password?',style: GoogleFonts.montserrat(color: const Color.fromARGB(255, 190, 189, 189),fontSize: 12),)),
            spacingHeight(15),
            Container(
              width: double.infinity,
              height: height*0.07,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
              gradient:loginGradient()
              ),
              child: Center(child: Text('Login',style: GoogleFonts.workSans(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)),
            ),
            spacingHeight(25),
            InkWell(
              child: Container(
                width: double.infinity,
                height: height*0.07,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                gradient:signupGradient()
                ),
                child: Center(child: Text('Sign Up',style: GoogleFonts.workSans(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SignUpPage())),
            ),
            spacingHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Do you Have an Account?',style: GoogleFonts.workSans(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.w500),),
                spacingWidth(2),
                Text('Sign Up',style: GoogleFonts.workSans(color: Colors.blue,fontSize: 10,fontWeight: FontWeight.w500),),
              ],
            ),
            Text('Or Login with',style: GoogleFonts.workSans(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.w500),),
            spacingHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height*0.07,
                  width:width*0.43 ,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/socialGoogle.png',height: height*0.04,),
                      spacingWidth(10),
                      Text('Google',style: GoogleFonts.montserrat(color: Colors.white,fontSize: 18),)
                    ],
                  ),
                ),
                spacingWidth(5),
                Container(
                  height: height*0.07,
                  width:width*0.43 ,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                    Icon(Iconsax.mobile,color: Colors.white,size: 35,),
                    spacingWidth(10),
                    Text('Phone',style: GoogleFonts.montserrat(color: Colors.white,fontSize: 18))
                   ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
} 