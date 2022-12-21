part of 'drink_bloc.dart';

@immutable
abstract class DrinkState {}

class DrinkInitial extends DrinkState {}

class DrinkListLoading extends DrinkState {}

class DrinkListSuccess extends DrinkState {
  final List<DrinkEntity> drinkModel;

  DrinkListSuccess(this.drinkModel);
}

class DrinkDetailSuccess extends DrinkState {
  final DrinkEntity drinkModel;

  DrinkDetailSuccess(this.drinkModel);
}

class DrinkListFailure extends DrinkState {}

class GetFavListLoading extends DrinkState {}

class GetFavListSuccess extends DrinkState {
  final List<DrinkEntity> drinkModel;

  GetFavListSuccess(this.drinkModel);
}

class GetFavListCountSuccess extends DrinkState {
  final List<DrinkEntity> dbDrinkModel;

  GetFavListCountSuccess(this.dbDrinkModel);
}

class GetFavListFailure extends DrinkState {}
