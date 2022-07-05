import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:zartek_test/model/fail.dart';

class ApiServices {
  final String url = 'https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad';
  void getProduct() async {
    try {
      var response = await Dio().get(url);
      // final thing =response.data[0]["table_menu_list"][0]["category_dishes"][1];
      final products = productFromJson(json.encode(response.data));
      log(products[0].tableMenuList![0].menuCategory);
    } catch (e) {
      log(e.toString());
    }
  }
  // static var client = http.Cli;

  // static Future<List<Products>> getProducts() async {
  //   var response = client.get('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad' as Uri);
  //   // var a = response;
  //    if (response.s == 200) {

  //    } else {

  //    }
  // }
}
