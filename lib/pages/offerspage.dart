import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    if(screenSize.width < 450 ) {
      return ListView(
        children: const  [
          Offer( title: "New Offers", description: "buy 2 get 2 free",),
          Offer( title: "Another Offers", description: "buy 2 get 3 free",),
          Offer( title: "Another Offers", description: "buy 2 get 3 free",),
          Offer( title: "Another Offers", description: "buy 2 get 3 free",),
          Offer( title: "More Offers", description: "buy 2 get 1 free",),
        ],
      );
    }
    return const Wrap(
      children: [
        Offer( title: "New Offers", description: "buy 2 get 2 free",),
        Offer( title: "Another Offers", description: "buy 2 get 3 free",),
        Offer( title: "Another Offers", description: "buy 2 get 3 free",),
        Offer( title: "Another Offers", description: "buy 2 get 3 free",),
        Offer( title: "More Offers", description: "buy 2 get 1 free",),
      ],
    );
  }
}

class Offer extends StatelessWidget {
  //Properties
  final String title;
  final String description;

  const Offer({super.key, required this.title, required this.description,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 7,
          color: Colors.brown.shade200,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/background.png"),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.amber.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(title, style: Theme.of(context).textTheme.headlineMedium, ),
                      ),
                    ),
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Container(
                    color: Colors.amber.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(description, style: Theme.of(context).textTheme.headlineSmall,),
                    ),
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}