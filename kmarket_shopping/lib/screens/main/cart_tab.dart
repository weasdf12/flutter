import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartTab extends StatefulWidget{
  const CartTab({super.key});

  @override
  State<StatefulWidget> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'),),
      body: Column(
        children: [
          Text('Cart 메인')
        ],
      ),
    );
  }

}