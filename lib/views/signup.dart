import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/helpers/helpers.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({super.key});
  TextEditingController firstnameController=TextEditingController();
  TextEditingController lastnameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 16, 34) ,
      ),
      backgroundColor: Color.fromARGB(255, 6, 16, 34),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            spacingHeight(height*0.075),
             Icon(Iconsax.user_add,color: Colors.white,size: 45,),
            spacingHeight(height*0.020),
             Text('Create New Account',style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),),
             spacingWidth(width*0.030),
            spacingHeight(height*0.030),
            textFormField(controller:firstnameController,text: 'Firstname' ),
            spacingHeight(height*0.030),
            textFormField(controller:lastnameController,text: 'Lastname' ),
            spacingHeight(height*0.015),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Create a strong password',style: TextStyle(color: Colors.grey,fontSize: 10),)),
            spacingHeight(height*0.015),
            textFormField(controller:passwordController,text: 'Password' ),
            spacingHeight(height*0.030),
            textFormField(controller:confirmController,text: 'Confirm' ),
            spacingHeight(height*0.040),
            InkWell(
              child: Container(
                width: double.infinity,
                height: height*0.07,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                gradient:loginGradient()
                ),
                child: Center(child: Text('Sign Up',style: GoogleFonts.workSans(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SignUpPage())),
            ),
          ],
        ),
      )
    );
  }
}