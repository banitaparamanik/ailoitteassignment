import 'package:ailoitteassignment/features/drink_listing/data/models/drink_list_model.dart';
import 'package:ailoitteassignment/features/drink_listing/data/models/drink_model.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:ailoitteassignment/core/error/failures.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/repositories/drinks_base_repository.dart';
import 'package:ailoitteassignment/utils/services/network_manager.dart';
import 'package:dartz/dartz.dart';

class DrinkRepository extends DrinksBaseRepository {
  final NetworkManager networkManager;

  DrinkRepository(this.networkManager);
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
}
