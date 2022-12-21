import 'package:ailoitteassignment/core/error/failures.dart';
import 'package:ailoitteassignment/core/usecases/use_cases.dart';
import 'package:ailoitteassignment/features/drink_listing/data/repositories/drink_repository.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:dartz/dartz.dart';

class GetDrinkByIdUseCase implements UseCase<Map<String, dynamic>, String> {
  final DrinkRepository drinksRepository;

  GetDrinkByIdUseCase(this.drinksRepository);
  @override
  Future<Either<Failure, Map<String, dynamic>>> call(String idDrink) async {
    return await drinksRepository.getDrinkById(idDrink);
  }
}
