import 'package:flutter/material.dart';
import 'package:shoppingapp/model/product_model.dart';

List<ProductModel> listOfProduct = [
  ProductModel(
      id: '1',
      title: 'Wrist Watch',
      price: 10000,
      brand: 'lexus',
      quantity: 10,
      images: 'assets/images/wristwatch1.png',
      totalrating: 4),
  ProductModel(
      id: '2',
      title: 'shoe',
      price: 20000,
      brand: 'nike',
      quantity: 3,
      images: 'assets/images/shoe1.png',
      totalrating: 3.5),
  ProductModel(
      id: '3',
      title: 'hoodie',
      price: 4700,
      brand: 'massmello',
      quantity: 10,
      images: 'assets/images/clothes1.png',
      totalrating: 4),
  ProductModel(
      id: '4',
      title: 'iphone 7',
      price: 150000,
      brand: 'iphone',
      quantity: 10,
      images: 'assets/images/iphone1.png',
      totalrating: 4),
  ProductModel(
      id: '5',
      title: 'wooden table',
      price: 10000,
      brand: 'wooden',
      quantity: 10,
      images: 'assets/images/funiture2.png',
      totalrating: 4),
  ProductModel(
      id: '6',
      title: 'Hp omen',
      price: 35000,
      brand: 'Hp',
      quantity: 10,
      images: 'assets/images/pcimg2.png',
      totalrating: 4.5),
  ProductModel(
      id: '7',
      title: 'Headset',
      price: 1500,
      brand: 'Golden',
      quantity: 4,
      images: 'assets/images/headsetImg4.png',
      totalrating: 4),
  ProductModel(
      id: '8',
      title: 'Washing machine',
      price: 57000,
      brand: 'Lg',
      quantity: 10,
      images: 'assets/images/washingmachin1.png',
      totalrating: 4),
  ProductModel(
      id: '9',
      title: 'Standing Fridge',
      price: 75000,
      brand: 'Lg',
      quantity: 10,
      images: 'assets/images/friedge2.png',
      totalrating: 4),
  ProductModel(
      id: '10',
      title: 'Chair',
      price: 7000,
      brand: 'Wooden',
      quantity: 10,
      images: 'assets/images/funiture1.png',
      totalrating: 4),
];

class RatingIndicator extends StatelessWidget {
  final double rating;

  RatingIndicator({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating) {
          if (index + 0.5 == rating) {
            return Icon(
              Icons.star_half,
              color: Colors.amber,
            );
          } else {
            return Icon(
              Icons.star,
              color: Colors.amber,
            );
          }
        } else {
          return Icon(
            Icons.star_border,
            color: Colors.amber,
          );
        }
      }),
    );
  }
}

List<ProductModel> cart = [];
