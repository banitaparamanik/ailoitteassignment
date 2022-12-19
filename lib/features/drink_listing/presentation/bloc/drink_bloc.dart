import 'dart:async';

import 'package:ailoitteassignment/core/usecases/use_cases.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/usecases/get_drinklist_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drink_event.dart';
part 'drink_state.dart';

class DrinkBloc extends Bloc<DrinkEvent, DrinkState> {
  DrinkBloc(this.getDrinkListUseCase) : super(DrinkInitial()) {
    on<GetDrinksListEvent>(_onGetDrinklistEvent);
    // on<SearchDrinksEvent>(_onSearchDrinksEvent);
  }

  final GetDrinkListUseCase getDrinkListUseCase;

  FutureOr<void> _onGetDrinklistEvent(
      GetDrinksListEvent event, Emitter<DrinkState> emit) async {
    emit(DrinkListLoading());
    final drinkListOrError = await getDrinkListUseCase(event.searchText);

    emit(drinkListOrError.fold(
        (l) => DrinkListFailure(), (r) => DrinkListSuccess(r)));
  }

  // FutureOr<void> _onSearchDrinksEvent(
  //     SearchDrinksEvent event, Emitter<DrinkState> emit) {}
}
