import 'package:coffee_mart/datamanager.dart';
import 'package:coffee_mart/datamodel.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {

  final DataManager dataManager;

  const MenuPage({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    var p = Product(id: 1, name: 'Car', price: 1.25, image: "test");
    return ListView(
      children: [
        ProductItem( product: p ),
        ProductItem( product: p ),
        ProductItem( product: p ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(elevation: 8,
        child: Column(
          children: [
            Image.asset("images/black_coffee.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold,),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("\$${product.price}"),
                ),
              ],),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton(onPressed: (){}, child: const Text("Add")),
              )
            ],)
          ],
        )
      ),
    );
  }
}