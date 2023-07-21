import 'package:coffee_mart/datamanager.dart';
import 'package:coffee_mart/datamodel.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;

  const MenuPage({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var categories = snapshot.data!;
            // return Text("This data is of length ${categories.length}");
            return ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(categories[index].name),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: categories[index].products.length,
                        itemBuilder: (context, productIndex) {
                          var currentProduct = categories[index].products[productIndex];
                          return ProductItem(
                            product: currentProduct,
                            onAdd: () {
                              dataManager.cartAdd(currentProduct);
                            },
                          );
                        },
                      )
                    ],
                  );
                });
          } else {
            if (snapshot.hasError) {
              return const Text("has error");
            } else {
              return const CircularProgressIndicator();
            }
          }
        },
        future: dataManager.getMenu());
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;

  const ProductItem({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 8,
          child: Column(
            children: [
              Image.network(product.imageUrl),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("\$${product.price}"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Add")),
                  )
                ],
              )
            ],
          )),
    );
  }
}
