import 'package:flutter/material.dart';
import 'package:medicine_store/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:medicine_store/models/category_model.dart';
import 'package:medicine_store/models/itemModel.dart';
import 'package:medicine_store/widgets/custom_nav_bar.dart';
class Home extends StatelessWidget {
   Home({super.key});
  final HomeController _homeController=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey.shade400,
                          backgroundImage: AssetImage("assets/profile.jpeg"),
                        ),
                        Column(
                          children: [
                            Text(
                              "Good Morning",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Abdiaziz",
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.grey.shade600,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 1),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                    border: InputBorder.none,
                    hintText: "Search",
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.filter_alt, color: Colors.grey.shade600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 0,
                        right: 0,
          
                        child: Container(
                          height: 170,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade500,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "15% OF",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Medicine at your doorstop",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text("Shop now"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 0,
                        child: Container(
                          height: 200,
          
                          child: Align(
                            alignment: AlignmentGeometry.topLeft,
                            child: Image.asset(
                              "assets/products/slide1.png",
                              height: 160,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("Top Categories"),
                    Spacer(),
                    Text("See All", style: TextStyle(color: Colors.green)),
                  ],
                ),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    itemCount: _homeController.categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                      final category=_homeController.categories[index];
                      return _BuildCategory(category);
                      })
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("BestSellar Products"),
                    Spacer(),
                    Text("See All", style: TextStyle(color: Colors.green)),
                  ],
                ),
                SizedBox(height: 10,),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: _homeController.bestSellerProducts.length,
                    physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75
                  ),
                  itemBuilder: (context,index){
                      final item=_homeController.bestSellerProducts[index];
                      return _BuildItemCard(item);
                  },
                ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:CustomNavBar(controller: _homeController,)
    );
  }

  Widget _BuildCategory(CategoryModel category){
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.green.shade100,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 8,
                offset: Offset(0,2,)
            )
          ]

      ),
      child: Center(
        child: Image.asset(category.imagePath,height: 50,),
      ),
    );
  }
  Widget _BuildItemCard(ItemModel item){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 8,
                offset: Offset(0,2,)
            )
          ]

      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16))
              ),
              child: Stack(
                children: [
                  Center(
                    child: Padding(padding: EdgeInsets.all(8),
                      child: Image.asset(item.imagePath,fit: BoxFit.contain,),
                    ),
                  ),
                  Positioned(
                      top: 8,
                      right: 8,
                      child:Container(
                        height: 32,
                        width: 32,

                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,)),
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(item.name,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87
                  ),
                ),
                Text(item.category),
                Row(
                  children: [
                    Text(item.price.toString(),style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,)),
                    Spacer(),
                    Icon(Icons.favorite,color: Colors.red,)
                  ],
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
