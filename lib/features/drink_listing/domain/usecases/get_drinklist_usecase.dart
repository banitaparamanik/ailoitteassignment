import 'package:ailoitteassignment/core/error/failures.dart';
import 'package:ailoitteassignment/core/usecases/use_cases.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/repositories/drinks_base_repository.dart';
import 'package:dartz/dartz.dart';

class GetDrinkListUseCase implements UseCase<List<DrinkEntity>, String> {
  final DrinksBaseRepository drinksRepository;

  GetDrinkListUseCase(this.drinksRepository);
  @override
  Future<Either<Failure, List<DrinkEntity>>> call(String params) async {
    return await drinksRepository.getDrinklist(params);
  }
}

// class Params extends Equatable {
//   final String searchText;

//   const Params(this.searchText);
//   @override
//   List<String> get props => [searchText];
// }
