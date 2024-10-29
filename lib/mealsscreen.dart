import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Models/Data/data.dart';
import 'cart.dart';

class MealsScreen extends StatelessWidget {
  final String categoryId;

  MealsScreen({required this.categoryId});


  @override
  Widget build(BuildContext context) {
    final categoryMeals = meals.where((meal) => meal.categoryIds.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Meals")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(categoryMeals.length, (index) {
              final meal = categoryMeals[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.97,
                      //color: Colors.black26,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(meal.title, style: TextStyle(fontSize: 18)),
                          Consumer<Cart>(
                            builder: (ctx, cart, child) => IconButton(
                              icon: Icon(
                                cart.cartItems.contains(meal) ? Icons.shopping_cart_rounded : Icons.shopping_cart_outlined,
                              ),
                              onPressed: () {
                                cart.cartItems.contains(meal)
                                    ? cart.removeFromCart(meal)
                                    : cart.addToCart(meal);
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
                          image: NetworkImage(meal.imageUrl),fit: BoxFit.cover
                        )
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
