import 'package:ailoitteassignment/core/error/failures.dart';
import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DrinksBaseRepository {
  Future<Either<Failure, List<DrinkEntity>>> getDrinklist(String searchText);
}
