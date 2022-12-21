import 'package:ailoitteassignment/features/drink_listing/data/models/drink_list_model.dart';
import 'package:ailoitteassignment/features/drink_listing/data/models/drink_model.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:ailoitteassignment/core/error/failures.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/repositories/drinks_base_repository.dart';
import 'package:ailoitteassignment/utils/database_helper.dart';
import 'package:ailoitteassignment/utils/services/network_manager.dart';
import 'package:dartz/dartz.dart';

class DrinkRepository extends DrinksBaseRepository {
  final NetworkManager networkManager;
  final DataBaseHelper dataBaseHelper;

  DrinkRepository(this.networkManager, this.dataBaseHelper);

  @override
  Future<Either<Failure, List<DrinkEntity>>> getDrinklist(
      String searchText) async {
    try {
      final result = await networkManager.get(
          "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$searchText");

      // List<DrinkModel> listDrink =
      //     List<DrinkModel>.from(result['drinks'].map((e) {
      //   return DrinkModel.fromJson(e);
      // }));
      return Right(DrinkListModel.fromJson(result).drinks);
    } catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }

  // @override
  // Future<Either<Failure, DrinkEntity>> getDrinkItemDetails(
  //     String idDrink) async {
  //   try {
  //     final result = await networkManager.get(
  //         " https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$idDrink");

  //     // List<DrinkModel> listDrink =
  //     //     List<DrinkModel>.from(result['drinks'].map((e) {
  //     //   return DrinkModel.fromJson(e);
  //     // }));
  //     return Right(DrinkModel.fromJson(result));
  //   } catch (e) {
  //     print(e);
  //     return Left(ServerFailure());
  //   }
  // }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getDrinkById(
      String idDrink) async {
    try {
      final result = await networkManager.get(
          "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$idDrink");
      final drinks = DrinkListModel.fromJson(result).drinks;
      if (drinks.isNotEmpty) {
        final data = drinks[0].toJson();
        await dataBaseHelper
            .insertData(tableName: DataBaseHelper.drinkTable, data: {
          "idDrink": data["idDrink"],
          "strAlcoholic": data["strAlcoholic"] ?? "",
          "strCategory": data["strCategory"] ?? "",
          "strDrink": data["strDrink"] ?? "",
          "strInstructions": data["strInstructions"] ?? "",
          "isFavorite": 1
        });
        return Right(data);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<DrinkEntity>>> getFavList() async {
    try {
      final favList =
          await dataBaseHelper.fetchAll(tableName: DataBaseHelper.drinkTable);
      List<DrinkModel> listDrink = List<DrinkModel>.from(favList.map((e) {
        return DrinkModel.fromJson(e);
      }));
      return Right(listDrink);
    } catch (_) {
      throw Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<DrinkEntity>>> getFavListCount() async {
    try {
      final favList =
          await dataBaseHelper.fetchAll(tableName: DataBaseHelper.drinkTable);
      List<DrinkModel> listDrink = List<DrinkModel>.from(favList.map((e) {
        return DrinkModel.fromJson(e);
      }));
      return Right(listDrink);
    } catch (_) {
      throw Left(CacheFailure());
    }
  }
}
