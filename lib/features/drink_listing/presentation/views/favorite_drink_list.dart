import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:ailoitteassignment/features/drink_listing/presentation/bloc/drink_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoriteDrinkList extends StatelessWidget {
  const FavoriteDrinkList({required this.favDrinkList, super.key});
  final List<DrinkEntity> favDrinkList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Text(" Favorite Drinks"), centerTitle: true),
        body: ListView.builder(
            itemCount: favDrinkList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: (() {
                  BlocProvider.of<DrinkBloc>(context).add(
                      GetDrinkItemDetailEvent(
                          favDrinkList[index].idDrink ?? ""));
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.push("/home/details", extra: favDrinkList[index]);
                }),
                leading:
                    const Icon(Icons.favorite, color: Colors.red, size: 45),
                title: Text("${favDrinkList[index].strDrink}"),
                subtitle: Text("${favDrinkList[index].strCategory}"),
              );
            }));
  }
}
