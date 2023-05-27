import 'dart:developer';

import 'package:foods_delivery/api/model/base_response.dart';
import 'package:foods_delivery/api/model/category_model.dart';
import 'package:foods_delivery/utils/constanst.dart';
import 'package:http/http.dart' as http;

class ApiService {

  final String baseUrl = Constants.baseUrl;
  
  Future<CategoryModel?> getAllCategory() async {
    try {
      var url = Uri.parse(baseUrl + Constants.categories);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return allCategoryFromJson(response.body);
      }
    }catch(e){
      log(e.toString());
    }
  }
  
  Future<BaseResponse?> getForYou() async{
    
    try{
      var url = Uri.parse(baseUrl + Constants.forYouApis);
      var response = await http.get(url);

      if(response.statusCode == 200) {
        return baseResponseFromJson(response.body);
      }

    }catch(e){
      log(e.toString());
    }
  }

  Future<BaseResponse?> getDessert() async {

    try{

      var url = Uri.parse(baseUrl + Constants.dessert);
      var response = await http.get(url);
      if(response.statusCode == 200){
        return baseResponseFromJson(response.body);
      }

    }catch(e){
      log(e.toString());
    }
  }

  Future<BaseResponse?> getByCategories(String str) async{
    try{
      var url = Uri.parse(baseUrl+Constants.forCategory + str);
      var response = await http.get(url);
      if(response.statusCode == 200){
        return baseResponseFromJson(response.body);
      }
    }catch(e){
      log(e.toString());
    }
  }
}