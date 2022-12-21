import 'package:ailoitteassignment/features/drink_listing/data/repositories/drink_repository.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/usecases/get_drink_by_id_usecase.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/usecases/get_drinklist_usecase.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/usecases/get_fav_list_usecase.dart';
import 'package:ailoitteassignment/features/drink_listing/presentation/bloc/drink_bloc.dart';
import 'package:ailoitteassignment/utils/database_helper.dart';
import 'package:ailoitteassignment/utils/router/router.dart';
import 'package:ailoitteassignment/utils/services/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  await DataBaseHelper.createDb();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DrinkBloc>(
      create: (context) {
         final drinkRepo = DrinkRepository(NetworkManager(), DataBaseHelper());
        return DrinkBloc(
            GetDrinkListUseCase(drinkRepo),
            GetDrinkByIdUseCase(drinkRepo),
            GetFavListUseCase(drinkRepo),
            // DeleteFavUseCase(drinkRepo)
            );
      },
          // DrinkBloc(GetDrinkListUseCase(DrinkRepository(NetworkManager()))),
      child: MaterialApp.router(
        title: 'Drinks',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
