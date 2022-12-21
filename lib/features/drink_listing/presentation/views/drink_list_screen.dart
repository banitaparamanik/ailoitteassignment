import 'package:ailoitteassignment/features/drink_listing/domain/usecases/get_fav_list_count_usecase.dart';
import 'package:ailoitteassignment/features/drink_listing/presentation/bloc/drink_bloc.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DrinkListScreen extends StatefulWidget {
  const DrinkListScreen({super.key});

  @override
  State<DrinkListScreen> createState() => _DrinkListScreenState();
}

class _DrinkListScreenState extends State<DrinkListScreen> {
  // final List<DrinkEntity> drinkList;
  @override
  void initState() {
    BlocProvider.of<DrinkBloc>(context).add(GetFavListCountEvent());

    super.initState();
  }

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
          BlocConsumer<DrinkBloc, DrinkState>(
            listenWhen: (oldState, newState) => newState is GetFavListSuccess,
            listener: (context, state) {
              if (state is GetFavListSuccess) {
                FocusManager.instance.primaryFocus?.unfocus();
                context.push("/home/favoriteDrinkList",
                    extra: state.drinkModel);
              }
            },
            buildWhen: (oldState, newState) =>
                newState is GetFavListCountSuccess,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(right:20),
                child: IconButton(
                  icon: Badge(
                    badgeContent: state is GetFavListCountSuccess
                        ? Text("${state.dbDrinkModel.length.toInt()}",style: const TextStyle(color: Colors.white),)
                        : const Text(""),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Icon(
                        Icons.favorite_sharp,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<DrinkBloc>(context).add(GetFavListEvent());
                  },
                ),
              );
            },
          )

          /*   BlocListener<DrinkBloc, DrinkState>(
            listener: (context, state) {
              if (state is GetFavListSuccess) {
                FocusManager.instance.primaryFocus?.unfocus();
                context.push("/home/favoriteDrinkList",
                    extra: state.drinkModel);
              }
            },
            child: IconButton(
              icon: Badge(
                badgeContent: Text("3"),
                child: const Icon(
                  Icons.favorite_sharp,
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                BlocProvider.of<DrinkBloc>(context).add(GetFavListEvent());
              },
            ),
          ), */
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
