import 'dart:convert';

import 'datamodel.dart';
import 'package:http/http.dart' as http;

class DataManager {
  List<Category>? _menu;
  List<ItemsInCart> cart = [];

  getMenu() async {
    const url = "https://firtman.github.io/coffeemasters/api/menu.json";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      var body = response.body;
      var decodedData = jsonDecode(body) as List<dynamic>;
      for (var json in decodedData) {
        _menu?.add(Category.fromJson(json));
      }
    }
  }

  Future<List<Category>> fetchMenu() async {
    if(_menu == null) {
      await getMenu();
    }

    return _menu!;

  }

  cartAdd (Product p) {
    bool found = false; 
    for (var item in cart) {
      if (item.product.id == p.id) {
        item.quantity++;
        found = true;
      }

      if(!!found) {
        cart.add(ItemsInCart(product: p, quantity: 1));
      }
    }
  }

  cartRemove (Product p) {
    cart.removeWhere((item) => item.product.id == p.id);
  }

  cartClear () {
    cart.clear();
  }

  double cartTotal () {
    var total = 0.0;
    for (var item in cart) {
      total += item.quantity * item.product.price;
    }
    return total;
  }

}