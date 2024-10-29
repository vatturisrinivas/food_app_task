import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/Models/Data/data.dart';
import 'package:recipe/Models/categories_model.dart';
import 'package:recipe/cartscreen.dart';
import 'package:recipe/mealsscreen.dart';
import 'Models/Data/data.dart';

class recipe extends StatelessWidget {
  const recipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton.icon(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
              },
              label: Icon(Icons.shopping_cart)
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MealsScreen(categoryId: categories[index].id)));
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                  Color(categories[index].color),Color(categories[index].color*2)
                    ]
                  )
                  //color: Color(categories[index].color),
                ),
                child: Center(
                  child: Text(categories[index].name,style: TextStyle(fontSize: 25,)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
