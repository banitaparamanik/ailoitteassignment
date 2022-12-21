part of 'drink_bloc.dart';

@immutable
abstract class DrinkEvent {}

class GetDrinksListEvent extends DrinkEvent {
  final String searchText;

  GetDrinksListEvent(this.searchText);
}

class GetDrinkItemDetailEvent extends DrinkEvent {
  final String drinkId;

  GetDrinkItemDetailEvent(this.drinkId);
}

class GetFavList extends DrinkEvent {}

