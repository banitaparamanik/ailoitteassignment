import 'dart:async';

import 'package:ailoitteassignment/core/usecases/use_cases.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/usecases/get_drink_by_id_usecase.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/usecases/get_drinklist_usecase.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/usecases/get_fav_list_count_usecase.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/usecases/get_fav_list_usecase.dart';
import 'package:ailoitteassignment/utils/database_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drink_event.dart';
part 'drink_state.dart';

class DrinkBloc extends Bloc<DrinkEvent, DrinkState> {
  DrinkBloc(this.getDrinkListUseCase, this.getDrinkByIdUseCase,
      this.getFavListUseCase, this.getFavListCountUseCase)
      : super(DrinkInitial()) {
    on<GetDrinksListEvent>(_onGetDrinklistEvent);
    on<GetDrinkItemDetailEvent>(_onGetDrinkItemDetailEvent);
    on<GetFavListEvent>(_onGetFavList);
    on<GetFavListCountEvent>(_onGetFavListCount);
  }

  final GetDrinkListUseCase getDrinkListUseCase;
  final GetDrinkByIdUseCase getDrinkByIdUseCase;
  final GetFavListUseCase getFavListUseCase;
  final GetFavListCountUseCase getFavListCountUseCase;

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
      GetFavListEvent event, Emitter<DrinkState> emit) async {
    emit(GetFavListLoading());
    final favListDrinkOrError = await getFavListUseCase(NoParams());

    emit(favListDrinkOrError.fold(
        (l) => GetFavListFailure(), (r) => GetFavListSuccess(r)));
  }

  FutureOr<void> _onGetFavListCount(
      GetFavListCountEvent event, Emitter<DrinkState> emit) async {
    final favListCountOrError = await getFavListCountUseCase(NoParams());
    emit(favListCountOrError.fold(
        (l) => GetFavListFailure(), (r) => GetFavListCountSuccess(r)));
  }
}
