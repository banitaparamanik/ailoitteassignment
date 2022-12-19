import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:flutter/material.dart';

class DrinkDetailsScreen extends StatelessWidget {
  const DrinkDetailsScreen({required this.drink, super.key});

  final DrinkEntity drink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drink Details"), centerTitle: true),
      body: Card(
        margin: const EdgeInsets.all(10),
        elevation: 20,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.green, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        shadowColor: Colors.green[100],
        child: ListTile(
          leading: const Icon(Icons.album, color: Colors.cyan, size: 45),
          title: Text("${drink.strDrink}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${drink.strCategory}"),
              Text("${drink.strInstructions}"),
            ],
          ),
        ),
      ),
    );
  }
}
