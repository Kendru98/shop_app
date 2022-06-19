import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '${cart.totalAmount}',
                      style: const TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Theme.of(context).backgroundColor,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStatePropertyAll(0.0),
                      ),
                      onPressed: (() {
                        //asd
                        Provider.of<Orders>(context, listen: false).addOrder(
                            cart.items.values.toList(), cart.totalAmount);
                        cart.clear();
                      }),
                      child: const Text(
                        'ORDER NOW',
                        style: TextStyle(color: Colors.deepPurple),
                      ))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (BuildContext context, int i) => CartItem(
                      cart.items.values.toList()[i].id,
                      cart.items.keys.toList()[i],
                      cart.items.values.toList()[i].price,
                      cart.items.values.toList()[i].quantity,
                      cart.items.values.toList()[i].title,
                    )),
          )
        ],
      ),
    );
  }
}
