import 'package:flutter/material.dart';
import 'package:shop_app/providers/orders.dart' as ord;
import 'package:intl/intl.dart';
import '';

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(DateFormat('dd MM yyyy').format(order.dateTime)),
            trailing: IconButton(
              onPressed: (() {}),
              icon: Icon(Icons.expand_more),
            ),
          ),
        ],
      ),
    );
  }
}
