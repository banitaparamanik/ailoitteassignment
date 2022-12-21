import 'dart:async';

import 'package:ailoitteassignment/core/usecases/use_cases.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/usecases/get_drink_by_id_usecase.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/usecases/get_drinklist_usecase.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/usecases/get_fav_list_usecase.dart';
import 'package:ailoitteassignment/utils/database_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drink_event.dart';
part 'drink_state.dart';

class DrinkBloc extends Bloc<DrinkEvent, DrinkState> {
  DrinkBloc(this.getDrinkListUseCase, this.getDrinkByIdUseCase,this.getFavListUseCase)
      : super(DrinkInitial()) {
    on<GetDrinksListEvent>(_onGetDrinklistEvent);
    on<GetDrinkItemDetailEvent>(_onGetDrinkItemDetailEvent);
    on<GetFavList>(_onGetFavList);

  }

  final GetDrinkListUseCase getDrinkListUseCase;
  final GetDrinkByIdUseCase getDrinkByIdUseCase;
  final GetFavListUseCase getFavListUseCase;
  // final DeleteFavUseCase deleteFavUseCase;


  FutureOr<void> _onGetDrinklistEvent(
      GetDrinksListEvent event, Emitter<DrinkState> emit) async {
    emit(DrinkListLoading());
    final drinkListOrError = await getDrinkListUseCase(event.searchText);

    emit(drinkListOrError.fold(
        (l) => DrinkListFailure(), (r) => DrinkListSuccess(r)));
  }

  FutureOr<void> _onGetDrinkItemDetailEvent(
      GetDrinkItemDetailEvent event, Emitter<DrinkState> emit) async {
    final drinkDetailOrError = await getDrinkByIdUseCase(event.drinkId);
    print(drinkDetailOrError);
  }

  
  FutureOr<void> _onGetFavList(
      GetFavList event, Emitter<DrinkState> emit) async {
    emit(GetFavListLoading());
    final favListDrinkOrError = await getFavListUseCase(NoParams());
    emit(favListDrinkOrError.fold(
        (l) => GetFavListFailure(), (r) => GetFavListSuccess(r)));
  }
}
