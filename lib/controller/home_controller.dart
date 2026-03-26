import 'package:get/get.dart';
import 'package:medicine_store/models/category_model.dart';
import 'package:medicine_store/models/itemModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class HomeController extends GetxController{

  final RxInt currentIndex=0.obs;
  final supabase=Supabase.instance.client;
  RxList<CategoryModel> categories=<CategoryModel>[
    CategoryModel(id: '1', name: "Essential Oils", imagePath: "assets/products/product1.png"),
    CategoryModel(id: '2', name: "Vitamins", imagePath: "assets/products/product2.png"),
    CategoryModel(id: '3', name: "Pills", imagePath: "assets/products/product3.png"),
    CategoryModel(id: '4', name: "Syrups", imagePath: "assets/products/product4.png"),
    CategoryModel(id: '5', name: "Creams", imagePath: "assets/products/product5.png"),
  ].obs;

  final RxList<ItemModel> bestSellerProducts=<ItemModel>[
    ItemModel(id: "1", name: "Liver Cleanse Detox", imagePath: "assets/products/product1.png", description: "HealthVoda Liver Cleanse Detox & Repair- Natural Liver Cleanse Detox", price: 29.99, category: "Suplement"),
    ItemModel(id: "2", name: "Nan-Drowsy Cold", imagePath: "assets/products/product2.png", description: "HealthVoda Liver Cleanse Detox & Repair- Natural Liver Cleanse Detox", price: 29.99, category: "Suplement"),
    ItemModel(id: "3", name: "Vitamin d3 ", imagePath: "assets/products/product3.png", description: "High Protein Diet", price: 19.99, category: "Suplement"),
    ItemModel(id: "4", name: "Cough Syrup ", imagePath: "assets/products/product4.png", description: "Natural Cough Syrup", price: 29.99, category: "Suplement"),

    ].obs;
  
  Future<RxList<CategoryModel>> getCtegories() async{
    final response= await supabase.from("categories").select("category_id,name,description,image_path");
    if(response !=null){
      categories.value=response.map((e)=>CategoryModel.fronJson(e)).toList();

    }
    else{
      print("Error");
    }
    return categories;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCtegories();

  }
  void updateSelectedIndex(int index){
    currentIndex.value=index;
  }



}