import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/Home/main_food_page.dart';
import 'package:food_delivery_app/resources/color_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final List<Widget> _pages = const <Widget>[
    MainFoodPage(),
    Center(child: Text('page 2')),
    Center(child: Text('page 3')),
    Center(child: Text('page 4')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentPage]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorManager.mainColor,
        unselectedItemColor: Colors.amber,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // because we don't show the label so we write these lines so that it doesn't cause any issue
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _currentPage,
        onTap: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Archive',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}