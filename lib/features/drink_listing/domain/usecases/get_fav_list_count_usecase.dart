import 'package:ailoitteassignment/core/error/failures.dart';
import 'package:ailoitteassignment/core/usecases/use_cases.dart';
import 'package:ailoitteassignment/features/drink_listing/data/repositories/drink_repository.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:dartz/dartz.dart';

class GetFavListCountUseCase implements UseCase<List<DrinkEntity>, NoParams> {
  final DrinkRepository drinksRepository;

  GetFavListCountUseCase(this.drinksRepository);
  @override
  Future<Either<Failure, List<DrinkEntity>>> call(NoParams noParams) async {
    return await drinksRepository.getFavListCount();
  }
}
