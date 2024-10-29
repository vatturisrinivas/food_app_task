import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: List.generate(cart.cartItems.length, (index)=>Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 50,
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(cart.cartItems[index].title, style: TextStyle(fontSize: 18)),
                    Consumer<Cart>(
                      builder: (ctx, cart, child) => IconButton(
                        icon: Icon(
                          cart.cartItems.contains(cart.cartItems) ? Icons.shopping_cart_rounded : Icons.shopping_cart_outlined,
                        ),
                        onPressed: () {
                          cart.removeFromCart(cart.cartItems[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.2,
                width: MediaQuery.of(context).size.width*0.97,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(cart.cartItems[index].imageUrl),fit: BoxFit.cover
                    )
                ),
              ),
            ],
          ),
        ))
      )
      // body: ListView.builder(
      //   itemCount: cart.cartItems.length,
      //   itemBuilder: (ctx, index) {
      //     final meal = cart.cartItems[index];
      //     return ListTile(
      //       title: Text(meal.title),
      //       trailing: IconButton(
      //         icon: Icon(Icons.shopping_cart_rounded),
      //         onPressed: () => cart.removeFromCart(meal),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
