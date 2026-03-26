import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medicine_store/controller/auth_controller.dart';
import 'package:medicine_store/scrrens/auth/signin.dart';
import 'package:get/get.dart';
class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SigninState();
}

class _SigninState extends State<Signup> {
  bool isPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  AuthController _authController=Get.put(AuthController());
  final _formKey=GlobalKey<FormState>();

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
              Center(child: Text("Sign Up",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900
              ),)),
              SizedBox(height: 20,),

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email,color: Colors.blue.shade600,),
                  border: InputBorder.none,
                  hintText: "Email",


                ),
                  validator: (value){
                    if(value!.isEmpty || !value.contains("@")){
                      return "Please Enter valid Email ";
                    }

                    return null;
                  }
              ),
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email,color: Colors.blue.shade600,),
              border: InputBorder.none,
              hintText: "Full Name",

            ),
          ),
              TextFormField(
                validator: (val){
                  if(val!.isEmpty){
                    return "Please Enter Password";
                  }
                  return null;
                },
                  controller: passwordController,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        isPassword = !isPassword;
                      });
                    }, icon: Icon(Icons.visibility)),
                    prefixIcon: Icon(Icons.password,color: Colors.blue.shade600,),
                    border: InputBorder.none,

                  )),
              TextFormField(
                validator: (val){
                  if(val!.isEmpty){
                    return "Please Enter Confirm Password";
                  }
                  if(val != passwordController.text){
                    return "Password Not Match";
                  }
                  return null;
                },
                  controller: confirmPasswordController,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        isPassword = !isPassword;
                      });
                    }, icon: Icon(Icons.visibility)),
                    prefixIcon: Icon(Icons.password,color: Colors.blue.shade600,),
                    border: InputBorder.none,

                  )),
              Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Text("Forgotten Password?",style: TextStyle(color: Colors.blue.shade400,fontSize: 18),)),

              Obx((){
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        minimumSize: Size(double.infinity, 60)
                    ),
                    onPressed: (){
                      if(!_formKey.currentState!.validate()){
                        return;
                      }
                      else{
                        _authController.SignupWithPassword(emailController.text, passwordController.text);

                      }

                    }, child: _authController.isloading==true?CircularProgressIndicator(color: Colors.white,):Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 24),));
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
                  text: "Already have Account? ",
                  children: [
                    TextSpan(
                        style: TextStyle(color: Colors.blue.shade600),
                        text: "Sing in ",
                      recognizer: TapGestureRecognizer()..onTap=(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
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
