import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_coffee_shop/service/endpoint.dart';

import '../model/coffee_model.dart';

class CoffeeService {
  Future<List<CoffeeModel>> getCoffee() async {
    try {
      final dio = Dio();
      const String url = Endpoint.baseUrl + Endpoint.coffee;

      final Response response = await dio.get(
        url,
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
