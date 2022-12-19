part of 'drink_bloc.dart';

@immutable
abstract class DrinkState {}

class DrinkInitial extends DrinkState {}

class DrinkListLoading extends DrinkState {}

class DrinkListSuccess extends DrinkState {
  final List<DrinkEntity> drinkModel;

  DrinkListSuccess(this.drinkModel);
  
}

class DrinkListFailure extends DrinkState {}
