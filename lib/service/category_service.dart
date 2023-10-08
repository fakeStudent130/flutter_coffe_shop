import 'package:dio/dio.dart';
import 'dart:developer';

import '../model/coffee_model.dart';

class CategoryService {
  String? category;
  Future<List<CoffeeModel>> getByCategory(category) async {
    try {
      final response = await Dio().get(
        ('https://cofee-shop.vercel.app/coffee/category/$category'),
      );

      final List<CoffeeModel> data;
      data = (response.data['data'] as List)
          .map((e) => CoffeeModel.fromJson(e))
          .toList();

      return data;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
