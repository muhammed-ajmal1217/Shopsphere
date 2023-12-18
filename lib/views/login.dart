
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/helpers/custom_container.dart';
import 'package:myapp/helpers/helpers.dart';
import 'package:myapp/services/auth_service.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  VoidCallback showRegisterPage;
   LoginPage({super.key,required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 6, 16, 34),
      body: Stack(
        
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: height*1.5,
              width: double.infinity,
              color: Color.fromARGB(255, 1, 72, 76)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  spacingHeight(100),
                  const Center(child: Icon(Iconsax.security_safe,color: Colors.white,size: 60,)),
                  spacingHeight(10),
                  Text('Welcome',style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
                  Text('Please enter your e-mail and password to Login',style: GoogleFonts.montserrat(color: const Color.fromARGB(255, 190, 189, 189),fontSize: 12),),
                  spacingHeight(20),
                  textFormField(controller: emailController,text: 'Email'),
                  spacingHeight(30),
                  textFormField(controller: passwordController,text: 'Password'),
                  spacingHeight(15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Forgot password?',style: GoogleFonts.montserrat(color: const Color.fromARGB(255, 190, 189, 189),fontSize: 12),)),
                  spacingHeight(15),
                  InkWell(
                    child: Container(
                      width: double.infinity,
                      height: height*0.07,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                      gradient:loginGradient()
                      ),
                      child: Center(child: Text('Login',style: GoogleFonts.workSans(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)),
                    ),
                    onTap: () => AuthService().signIn(emailController.text.trim(), passwordController.text.trim())
                  ),
                  spacingHeight(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Do you Have an Account?',style: GoogleFonts.workSans(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.w500),),
                      spacingWidth(10),
                      InkWell(
                        onTap:  () => widget.showRegisterPage(),
                        child: Text('Sign Up',style: GoogleFonts.workSans(color: Colors.blue,fontSize: 13,fontWeight: FontWeight.w500),)),
                    ],
                  ),
                  Text('Or Sign in with',style: GoogleFonts.workSans(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.w500),),
                  spacingHeight(10),
                  spacingHeight(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: height*0.07,
                        width:width*0.43 ,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/socialGoogle.png',height: height*0.04,),
                            spacingWidth(10),
                            GestureDetector(
                              onTap: () => AuthService().signInWithGoogle(),
                              child: Text('Google',style: GoogleFonts.montserrat(color: Colors.white,fontSize: 18),))
                          ],
                        ),
                      ),
                      spacingWidth(5),
                      Container(
                        height: height*0.07,
                        width:width*0.43 ,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
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
          ),
        ],
      ),
    );
  }

} 