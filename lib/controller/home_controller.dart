import 'package:get/get.dart';
import 'package:medicine_store/models/category_model.dart';
import 'package:medicine_store/models/itemModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class HomeController extends GetxController{

  final RxInt currentIndex=0.obs;
  final supabase=Supabase.instance.client;
  RxList<CategoryModel> categories=<CategoryModel>[
  ].obs;

  final RxList<ItemModel> bestSellerProducts=<ItemModel>[
    ItemModel(id: "1", name: "Liver Cleanse Detox", imagePath: "assets/products/product1.png", description: "HealthVoda Liver Cleanse Detox & Repair- Natural Liver Cleanse Detox", price: 29.99, category: "Suplement"),
    ItemModel(id: "2", name: "Nan-Drowsy Cold", imagePath: "assets/products/product2.png", description: "HealthVoda Liver Cleanse Detox & Repair- Natural Liver Cleanse Detox", price: 29.99, category: "Suplement"),
    ItemModel(id: "3", name: "Vitamin d3 ", imagePath: "assets/products/product3.png", description: "High Protein Diet", price: 19.99, category: "Suplement"),
    ItemModel(id: "4", name: "Cough Syrup ", imagePath: "assets/products/product4.png", description: "Natural Cough Syrup", price: 29.99, category: "Suplement"),

    ].obs;
  Future<void> getCategories() async{
    final response=await supabase.from("categories").select("category_id,name,image_path");
    if(response !=null){
      categories.value=response.map((category)=>CategoryModel.fromJson(category)).toList();
    }

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
  }

  void updateSelectedIndex(int index){
    currentIndex.value=index;
  }

  //STeps
//Step1: fetch from Supabase
//Step2:Json Converter Model;
//step3:Map Fetched to List


}