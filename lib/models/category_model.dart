class CategoryModel{
  final String id;
  final String name;
  final String imagePath;
CategoryModel({required this.id,required this.name,required this.imagePath});
factory CategoryModel.fronJson(Map<String,dynamic> json){
  return CategoryModel(id: json['category_id'], name: json['name'], imagePath: json['image_path']);
}

}
