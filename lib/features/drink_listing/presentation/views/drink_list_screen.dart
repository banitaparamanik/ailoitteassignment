import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:ailoitteassignment/features/drink_listing/presentation/bloc/drink_bloc.dart';
import 'package:ailoitteassignment/features/drink_listing/presentation/views/favorite_drink_list.dart';
import 'package:ailoitteassignment/utils/router/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DrinkListScreen extends StatelessWidget {
  const DrinkListScreen({super.key});
  // final List<DrinkEntity> drinkList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Drinks",
            )),
        actions: <Widget>[
          BlocListener<DrinkBloc, DrinkState>(
            listener: (context, state) {
              if (state is GetFavListSuccess) {
                FocusManager.instance.primaryFocus?.unfocus();
                context.push("/home/favoriteDrinkList",
                    extra: state.drinkModel);
              }
            },
            child: IconButton(
              icon: const Icon(
                Icons.favorite_sharp,
                color: Colors.red,
              ),
              onPressed: () {
                BlocProvider.of<DrinkBloc>(context).add(GetFavList());
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                onChanged: (val) {
                  BlocProvider.of<DrinkBloc>(context)
                      .add(GetDrinksListEvent(val));
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter drink item to get data',
                ),
              ),
            ),
            Expanded(
                child: BlocBuilder<DrinkBloc, DrinkState>(
              buildWhen: (previous, current) =>
                  current is DrinkListSuccess || current is DrinkListLoading,
              builder: (context, state) {
                if (state is DrinkListSuccess) {
                  return ListView.builder(
                      itemCount: state.drinkModel.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: (() {
                            FocusManager.instance.primaryFocus?.unfocus();
                            context.push("/home/details",
                                extra: state.drinkModel[index]);
                          }),
                          title: Text("${state.drinkModel[index].strDrink}"),
                          subtitle:
                              Text("${state.drinkModel[index].strCategory}"),
                        );
                      });
                }
                if (state is DrinkListLoading) {
                  return const Center(
                    child: Text("Loading...."),
                  );
                }
                return Container();
              },
            ))
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: drinkList.length,
            //       itemBuilder: (context, index) {
            //         return ListTile(
            //           onTap: (() {
            //             // FocusManager.instance.primaryFocus?.unfocus();
            //             // Navigator.of(context).pushNamed(
            //             //   RoutePaths.home,
            //             //   // arguments: country
            //             // );
            //           }),
            //           title: Text("${drinkList[index].strDrink}"),
            //           subtitle: Text("${drinkList[index].strCategory}"),
            //         );
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}
