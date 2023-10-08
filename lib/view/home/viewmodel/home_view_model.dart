import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/model/coffee_model.dart';
import 'package:flutter_coffee_shop/service/coffee_service.dart';
import 'package:flutter_coffee_shop/utils/state/finite_state.dart';

class HomeViewModel extends ChangeNotifier {
  MyState _state = MyState.initial;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  final CoffeeService coffeeService = CoffeeService();

  late List<CoffeeModel> coffeeList = [];
  MyState get state => _state;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void changeState(MyState state) {
    _state = state;
    notifyListeners();
  }

  void fetchAllCoffee() async {
    try {
      changeState(MyState.loading);
      coffeeList = await coffeeService.getCoffee();
      changeState(MyState.loaded);
    } catch (e) {
      changeState(MyState.failed);
      rethrow;
    }
  }
}
