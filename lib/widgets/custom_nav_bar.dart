import 'package:flutter/material.dart';
import 'package:medicine_store/controller/home_controller.dart';
import 'package:get/get.dart';
class CustomNavBar extends StatelessWidget {
  final HomeController controller;
  CustomNavBar({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (i){
            controller.updateSelectedIndex(i);

          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey.shade50,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey.shade600,
          elevation: 0,
          iconSize: 30,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",

            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart),
                label: "Cart"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: "Wishlist"
            ),
            BottomNavigationBarItem(

                icon: Icon(Icons.voice_chat_outlined),
                label: "chat"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile"
            ),
          ]);
    });
  }
}
