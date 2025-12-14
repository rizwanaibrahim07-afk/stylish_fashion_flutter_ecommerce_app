class SubCategoryModel{
  final int id;
  final int category_id;
  final String name;

  SubCategoryModel({required this.category_id,required this.id,required this.name,});

  factory SubCategoryModel.fromJson(Map<String,dynamic> Json){
    return SubCategoryModel(id: Json['id'],category_id: Json['category_id'],
        name:Json['name'],);
  }



}