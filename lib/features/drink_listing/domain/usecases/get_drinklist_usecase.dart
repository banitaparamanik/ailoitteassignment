import 'package:ailoitteassignment/core/error/failures.dart';
import 'package:ailoitteassignment/core/usecases/use_cases.dart';
import 'package:ailoitteassignment/features/drink_listing/data/repositories/drink_repository.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:dartz/dartz.dart';

class GetDrinkListUseCase implements UseCase<dynamic, String> {
  final DrinkRepository drinksRepository;

  GetDrinkListUseCase(this.drinksRepository);
  @override
  Future<Either<Failure, List<DrinkEntity>>> call(String params) async {
    return await drinksRepository.getDrinklist(params);
  }

  // @override
  // Future<Either<Failure, DrinkEntity>> callDrinkDetails(String idDrink) async {
  //   return await drinksRepository.getDrinkItemDetails(idDrink);
  // }
}

// class Params extends Equatable {
//   final String searchText;

//   const Params(this.searchText);
//   @override
//   List<String> get props => [searchText];
// }
