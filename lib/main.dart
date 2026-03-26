import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_store/scrrens/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://cipqhxiwucgapjdckowv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNpcHFoeGl3dWNnYXBqZGNrb3d2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc2NTk5MTUsImV4cCI6MjA4MzIzNTkxNX0.TBfhnOtsuwDK9CtUiqQKpuhx1njcw44CDP-3nhli9sE',
  );
  runApp(MedicineStoreApp());
}

class MedicineStoreApp extends StatelessWidget {
  const MedicineStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      home: SplashScreen(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.blue.shade900,
                    width: 0.7
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.blue.shade900,
                    width: 0.7
                )
            )
        )
      ),
    );
  }
}
