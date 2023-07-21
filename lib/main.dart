import 'package:coffee_mart/datamanager.dart';
import 'package:coffee_mart/pages/menupage.dart';
import 'package:coffee_mart/pages/offerspage.dart';
import 'package:coffee_mart/pages/orderspage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Masters',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:  Colors.brown),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var dataManager = DataManager();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget currentPageWidget = const Text("!");

    switch(selectedIndex) {
      case 0: 
        currentPageWidget = MenuPage(dataManager: dataManager);
        break;
      case 1: 
        currentPageWidget = const OffersPage();
        break;
      case 2: 
        currentPageWidget = OrdersPage(dataManager: dataManager);
        break;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Image.asset("images/logo.png"),
      ),
      body: currentPageWidget,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.coffee), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Offers"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Orders"),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.yellow.shade400,
        unselectedItemColor: Colors.yellow.shade50,
        currentIndex: selectedIndex,
        onTap: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
      ),
    );
  }
}


class InputText extends StatefulWidget {
  const InputText({super.key});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  var name = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("hellooooo $name"),
        TextField(
          onChanged: (value) => {
            setState(() {
              name = value;
            })
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Your Name:",
          ),
        ),
      ],
    );
  }
}