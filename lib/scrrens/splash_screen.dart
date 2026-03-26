import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine_store/scrrens/auth/signin.dart';
import 'package:medicine_store/scrrens/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> _redirect() async{
    await Future.delayed(Duration(seconds: 3));
    final session=await Supabase.instance.client.auth.currentSession;
    if(session!=null){
      Get.offAll(()=>Home());
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signin()));

    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _redirect();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,

          strokeWidth: 2,
          strokeAlign: 10,
        ),
      ),
    );
  }
}
