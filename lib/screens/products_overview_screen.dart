import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/badge.dart';

import '../providers/cart.dart';
import '../providers/products_provider.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    final productsDate = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                  //all items
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                  value: FilterOptions.favorites,
                  child: Text('Only Favorites')),
              const PopupMenuItem(
                  value: FilterOptions.all, child: Text('Show All')),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
                value: cartData.itemCount.toString(),
                color: Colors.red,
                child: ch!),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (() {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              }),
            ),
          )
          // IconButton(onPressed: (), icon: icon)
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
