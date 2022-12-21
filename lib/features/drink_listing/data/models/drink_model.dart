import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'drink_model.g.dart';

@JsonSerializable()
class DrinkModel extends DrinkEntity {
  const DrinkModel(
      {bool favorite = false,
      String? idDrink,
      String? strDrink,
      String? strDrinkAlternate,
      String? strTags,
      String? strVideo,
      String? strCategory,
      String? strIBA,
      String? strAlcoholic,
      String? strGlass,
      String? strInstructionsES,
      String? strInstructions,
      String? strInstructionsDE,
      String? strInstructionsFR,
      String? strInstructionsIT,
      String? strInstructionsZHHANS,
      String? strInstructionsZHHANT,
      String? strDrinkThumb,
      String? strIngredient1,
      String? strIngredient2,
      String? strIngredient3,
      String? strIngredient4,
      String? strIngredient5,
      String? strIngredient6,
      String? strIngredient7,
      String? strIngredient8,
      String? strIngredient9,
      String? strIngredient10,
      String? strIngredient11,
      String? strIngredient12,
      String? strIngredient13,
      String? strIngredient14,
      String? strIngredient15,
      String? strMeasure1,
      String? strMeasure2,
      String? strMeasure3,
      String? strMeasure4,
      String? strMeasure5,
      String? strMeasure6,
      String? strMeasure7,
      String? strMeasure8,
      String? strMeasure9,
      String? strMeasure10,
      String? strMeasure11,
      String? strMeasure12,
      String? strMeasure13,
      String? strMeasure14,
      String? strMeasure15,
      String? strImageSource,
      String? strImageAttribution,
      String? strCreativeCommonsConfirmed,
      String? dateModified})
      : super(
            idDrink: idDrink,
            favorite: favorite,
            strDrink: strDrink,
            strDrinkAlternate: strDrinkAlternate,
            strTags: strTags,
            strVideo: strVideo,
            strCategory: strCategory,
            strIBA: strIBA,
            strAlcoholic: strAlcoholic,
            strGlass: strGlass,
            strInstructionsES: strInstructionsES,
            strInstructions: strInstructions,
            strInstructionsDE: strInstructionsDE,
            strInstructionsFR: strInstructionsFR,
            strInstructionsIT: strInstructionsIT,
            strInstructionsZHHANS: strInstructionsZHHANS,
            strInstructionsZHHANT: strInstructionsZHHANT,
            strDrinkThumb: strDrinkThumb,
            strIngredient1: strIngredient1,
            strIngredient2: strIngredient2,
            strIngredient3: strIngredient3,
            strIngredient4: strIngredient4,
            strIngredient5: strIngredient5,
            strIngredient6: strIngredient6,
            strIngredient7: strIngredient7,
            strIngredient8: strIngredient8,
            strIngredient9: strIngredient9,
            strIngredient10: strIngredient10,
            strIngredient11: strIngredient11,
            strIngredient12: strIngredient12,
            strIngredient13: strIngredient13,
            strIngredient14: strIngredient14,
            strIngredient15: strIngredient15,
            strMeasure1: strMeasure1,
            strMeasure2: strMeasure2,
            strMeasure3: strMeasure3,
            strMeasure4: strMeasure4,
            strMeasure5: strMeasure5,
            strMeasure6: strMeasure6,
            strMeasure7: strMeasure7,
            strMeasure8: strMeasure8,
            strMeasure9: strMeasure9,
            strMeasure10: strMeasure10,
            strMeasure11: strMeasure11,
            strMeasure12: strMeasure12,
            strMeasure13: strMeasure13,
            strMeasure14: strMeasure14,
            strMeasure15: strMeasure15,
            strImageSource: strImageSource,
            strImageAttribution: strImageAttribution,
            strCreativeCommonsConfirmed: strCreativeCommonsConfirmed,
            dateModified: dateModified);

  factory DrinkModel.fromJson(Map<String, dynamic> json) =>
      _$DrinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkModelToJson(this);
}
