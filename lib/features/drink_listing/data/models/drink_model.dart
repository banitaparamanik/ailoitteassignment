import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'drink_model.g.dart';

@JsonSerializable()
class DrinkModel extends DrinkEntity {
  const DrinkModel(
      {super.isFavorite,
      super.idDrink,
      super.strDrink,
      super.strDrinkAlternate,
      super.strTags,
      super.strVideo,
      super.strCategory,
      super.strIBA,
      super.strAlcoholic,
      super.strGlass,
      super.strInstructionsES,
      super.strInstructions,
      super.strInstructionsDE,
      super.strInstructionsFR,
      super.strInstructionsIT,
      super.strInstructionsZHHANS,
      super.strInstructionsZHHANT,
      super.strDrinkThumb,
      super.strIngredient1,
      super.strIngredient2,
      super.strIngredient3,
      super.strIngredient4,
      super.strIngredient5,
      super.strIngredient6,
      super.strIngredient7,
      super.strIngredient8,
      super.strIngredient9,
      super.strIngredient10,
      super.strIngredient11,
      super.strIngredient12,
      super.strIngredient13,
      super.strIngredient14,
      super.strIngredient15,
      super.strMeasure1,
      super.strMeasure2,
      super.strMeasure3,
      super.strMeasure4,
      super.strMeasure5,
      super.strMeasure6,
      super.strMeasure7,
      super.strMeasure8,
      super.strMeasure9,
      super.strMeasure10,
      super.strMeasure11,
      super.strMeasure12,
      super.strMeasure13,
      super.strMeasure14,
      super.strMeasure15,
      super.strImageSource,
      super.strImageAttribution,
      super.strCreativeCommonsConfirmed,
      super.dateModified});

  factory DrinkModel.fromJson(Map<String, dynamic> json) =>
      _$DrinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkModelToJson(this);
}
