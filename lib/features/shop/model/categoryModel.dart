class CategoryModel{
  final int id;
  final String name;
  final String  imageUrl;
  final String bannerimageUrl;
  CategoryModel({required this.id,required this.name,required this.imageUrl,required this.bannerimageUrl});

  factory CategoryModel.fromJson(Map<String,dynamic> Json){
    return CategoryModel(id: Json['id'],
        name:Json['name'], imageUrl: Json['imageUrl'],bannerimageUrl:Json['bannerimageUrl']);
  }



}