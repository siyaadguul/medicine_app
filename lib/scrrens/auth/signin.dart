import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medicine_store/controller/auth_controller.dart';
import 'package:medicine_store/scrrens/auth/signup.dart';
import 'package:get/get.dart';
class Signin extends StatefulWidget {
   Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool ispassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey=GlobalKey<FormState>();
  final AuthController _authController=Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Sign in",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),)),
              SizedBox(height: 20,),

              TextFormField(
                controller: emailController,
                validator: (val){
                  if(val == null || val.isEmpty){
                    return "Please Enter Email";
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email,color: Colors.blue.shade600,),
                  border: InputBorder.none,
                  hintText: "Email",

                ),
              ),
              TextFormField(
                  controller: passwordController,
                  validator: (val){
                    if(val == null || val.isEmpty){
                      return "Please Enter Password";
                    }
                    return null;
                  },
                  obscureText: ispassword,
                  decoration: InputDecoration(
                    hintText: "password",
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        ispassword = !ispassword;
                      });
                    }, icon: Icon(Icons.visibility)),
                    prefixIcon: Icon(Icons.password,color: Colors.blue.shade600,),
                    border: InputBorder.none,
                  )
              ),
              Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Text("Forgotten password?",style: TextStyle(color: Colors.blue.shade400,fontSize: 18),)),
              Obx((){
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        minimumSize: Size(double.infinity,60)
                    ),
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        _authController.signinWithPassword(emailController.text, passwordController.text);
                      }
                    }, child: _authController.isloading==true?CircularProgressIndicator(color: Colors.white,):Text("Sign in",style: TextStyle(color: Colors.white,fontSize: 24),) );
              }),
              Row(
                spacing: 10,
                children: [
                  Expanded(child: Divider(thickness: 1,)),
                  Text("Or",style: TextStyle(fontSize: 18),),
                  Expanded(child: Divider(thickness: 1,))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 40,
                children: [
                  Image.asset("assets/x.png",height: 35,),
                  Image.asset("assets/facebook.png",height: 35,),
                  Image.asset("assets/google.png",height: 35,),
                ],
              ),
              RichText(text: TextSpan(
                  style: TextStyle(color: Colors.grey.shade900,fontSize: 18),
                  text: "Don't have Account?",
                  children: [
                    TextSpan(
                        style: TextStyle(color: Colors.blue.shade600),
                        text: "Signup",
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Signup()));
                        }
                    ),

                  ]
              ))

            ],
          ),
        ),
      ),
    );
  }

}
