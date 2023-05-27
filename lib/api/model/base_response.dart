import 'dart:convert';

import 'package:foods_delivery/api/model/for_you_model.dart';

class BaseResponse {
  final List<ForYouModel> meals;

  BaseResponse({required this.meals});

  factory BaseResponse.fromJson(Map<String,dynamic> json){
    return BaseResponse(
      meals: List<ForYouModel>.from(json['meals'].map((x) => ForYouModel.fromJson(x)))
    );
  }

  Map<String,dynamic> toJson() => {
    'meals' : List<dynamic>.from(meals.map((e) => e.toJson()))
  };
}

BaseResponse baseResponseFromJson(String str) => BaseResponse.fromJson(json.decode(str));
String baseResponseToJson(BaseResponse data) => json.encode(data.toJson());
