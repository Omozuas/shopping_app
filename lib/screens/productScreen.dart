import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/data/dummy_data.dart';
import 'package:shoppingapp/model/messageRes.dart';
import 'package:shoppingapp/model/product_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(
      {super.key,
      required List<ProductModel> cart,
      required void Function(ProductModel product) addToCart});
  void addTocart(ProductModel productModel) async {
    cart.add(productModel);
    print('${productModel.title} added to cart');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('product'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              mainAxisExtent: 350),
          itemCount: listOfProduct.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              onHover: (value) {},
              child: Container(
                width: 280,
                child: Card(
                  elevation: 0,
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, right: 5, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 280,
                          height: 180,
                          child: Stack(
                            children: [
                              Center(
                                  child: Image.asset(
                                "${listOfProduct[index].images}",
                                height: 160,
                                width: 130,
                              )),
                              Positioned(
                                  left: 5,
                                  top: 10,
                                  child: Container(
                                      width: 40,
                                      height: 20,
                                      child: Center(
                                        child: Text(
                                          "-10%",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3)),
                                          color: Colors.orange))),
                              Positioned(
                                  right: 10,
                                  top: 10,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                        width: 25,
                                        height: 25,
                                        child: Center(
                                          child: Icon(
                                            CupertinoIcons.heart,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            color: Colors.orange
                                                .withOpacity(0.4))),
                                  ))
                            ],
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${listOfProduct[index].title}".toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${listOfProduct[index].brand}".toUpperCase(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RatingIndicator(
                            rating: listOfProduct[index].totalrating),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\N${listOfProduct[index].price}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              addTocart(listOfProduct[index]);
                              success(
                                  context: context,
                                  message:
                                      '${listOfProduct[index].title} added to cart');
                            },
                            child: Container(
                              width: 220,
                              height: 45,
                              child: Center(
                                child: Text("add to cart".toUpperCase(),
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
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
