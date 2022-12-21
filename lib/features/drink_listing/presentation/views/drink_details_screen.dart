import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:ailoitteassignment/features/drink_listing/presentation/bloc/drink_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinkDetailsScreen extends StatefulWidget {
  const DrinkDetailsScreen({required this.drink, super.key});

  final DrinkEntity drink;

  @override
  State<DrinkDetailsScreen> createState() => _DrinkDetailsScreenState();
}

class _DrinkDetailsScreenState extends State<DrinkDetailsScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    isFavorite = widget.drink.favorite;
    super.initState();
  }

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
          leading: GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
                BlocProvider.of<DrinkBloc>(context)
                    .add(GetDrinkItemDetailEvent(widget.drink.idDrink ?? ""));
              },
              child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red, size: 45)),
          title: Text("${widget.drink.strDrink}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${widget.drink.strCategory}"),
              Text("${widget.drink.strInstructions}"),
            ],
          ),
        ),
      ),
    );
  }
}
