import 'package:flutter/material.dart';
import 'package:shoppingapp/data/dummy_data.dart';
import 'package:shoppingapp/model/product_model.dart';
import 'package:shoppingapp/screens/cartScreen.dart';
import 'package:shoppingapp/screens/productScreen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addToCart(ProductModel product) {
    setState(() {
      cart.add(product);
    });
  }

  void removeFromCart(ProductModel product) {
    setState(() {
      cart.remove(product);
    });
  }

  // ignore: prefer_final_fields
  List<Widget> _widgetOptions() {
    return [
      ProductScreen(
        cart: cart,
        addToCart: addToCart,
      ),
      CartPage(
        cart: cart,
        removeFromCart: removeFromCart,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    int cartItemCount = cart.length;
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _widgetOptions()),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: Stack(
                children: <Widget>[
                  Icon(Icons.shopping_basket_outlined),
                  if (cart.isNotEmpty)
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: Text(
                          '${cartItemCount}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
