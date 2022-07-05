import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:zartek_test/model/fail.dart';

class ApiServices {
  static String url = 'https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad';

 static Future<List<Product>?> getProduct() async {
    try {
      var response = await Dio().get(url);
      final products = productFromJson(json.encode(response.data));
      return products;
      // log(products[0].tableMenuList![0].menuCategory);
    } catch (e) {
      log(e.toString());
      //  return e();
    }
    return null;
  }
}

      // final thing =response.data[0]["table_menu_list"][0]["category_dishes"][1];