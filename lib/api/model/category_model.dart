import 'dart:convert';

import 'package:foods_delivery/api/model/category.dart';

class CategoryModel {
  final List<Category> categories;

  CategoryModel({required this.categories});

  factory CategoryModel.fromJson(Map<String,dynamic> json){
    return CategoryModel(
      categories: List<Category>.from(json['categories'].map((x) => Category.fromJson(x)))
    );
  }

  Map<String,dynamic> toJson() =>{
    'categories' : List<dynamic>.from(categories.map((e) => e.toJson()))
  };
}

CategoryModel allCategoryFromJson(String str) => CategoryModel.fromJson(json.decode(str));
String allCategoryToJson(CategoryModel data) => json.encode(data.toJson());
