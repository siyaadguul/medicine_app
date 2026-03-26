import 'package:get/get.dart';
import 'package:medicine_store/scrrens/auth/signin.dart';
import 'package:medicine_store/scrrens/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
class AuthController extends GetxController{
  final _isloading=false.obs;
  get isloading => _isloading.value;
  final supabase=Supabase.instance.client;

  Future <void> SignupWithPassword(String email,String password) async{
    _isloading.value=true;
    try{
      final response= await supabase.auth.signUp(password: password,email: email);
      if(response.user !=null){
        _isloading.value=false;
        Get.showSnackbar(const GetSnackBar(
          title: "Success",
          message: "Signup Success",
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ));
        Get.offAll(Signin());

      }
    }
    catch(e){
      _isloading.value=false;
      Get.showSnackbar(  GetSnackBar(
        title: "Error",
        message: e.toString(),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,

      ));

    }
  }

  Future<void> signinWithPassword(String email,String password) async{
    _isloading.value=true;
    try{
      final response= await supabase.auth.signInWithPassword(password: password,email: email);
      if(response.user !=null) {
        _isloading.value = false;
        Get.offAll(()=>Home());

      }
      }
      catch(e){
        _isloading.value=false;
        Get.showSnackbar(GetSnackBar(
          title: "Sign in Failed",
          message: e.toString(),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ));
      }
    }

    Future <void> signout() async{
    try{
      await supabase.auth.signOut();
      Get.offAll(Signin());
    }
    catch(e){
      Get.showSnackbar(GetSnackBar(
        title: "Sign out Failed",
        message: e.toString(),
        duration: Duration(seconds: 2),
      ));

    }
    }




}