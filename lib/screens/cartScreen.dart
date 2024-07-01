import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoppingapp/data/dummy_data.dart';
import 'package:shoppingapp/model/messageRes.dart';
import 'package:shoppingapp/model/product_model.dart';
import 'package:shoppingapp/screens/checkoutScreen.dart';

class CartPage extends StatefulWidget {
  const CartPage(
      {super.key,
      required List<ProductModel> cart,
      required void Function(ProductModel product) removeFromCart});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      cart.runtimeType;
    });
    print('object');
  }

  void removeFromCart(ProductModel product) {
    cart.remove(product);
    print('${product.title} removed from cart');
  }

  void checkout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CheckoutSuccessPage()),
    );
    setState(() {
      cart.clear();
    });

    success(context: context, message: 'Cart cleared.');
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice =
        cart.fold(0, (previousValue, product) => previousValue + product.price);
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: SingleChildScrollView(
          child: cart.isNotEmpty
              ? Column(
                  children: [
                    Text(
                      "Products in Your cart",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.asset(cart[index].images),
                          title: Text(cart[index].title),
                          subtitle: Text('\N${cart[index].price}'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              success(
                                  context: context,
                                  message:
                                      '${cart[index].title} removed from cart');
                              setState(() {
                                removeFromCart(cart[index]);
                              });
                            },
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Total Price: \₦$totalPrice',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          checkout();
                        },
                        child: Container(
                          width: 220,
                          height: 45,
                          child: Center(
                            child: Text("checkout".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800)),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                        ),
                      ),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Center(
                      child: Text('Your Cart is Empty'),
                    ),
                  ],
                ),
        ));
  }
}
