import 'package:ailoitteassignment/features/drink_listing/data/models/drink_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'drink_list_model.g.dart';

@JsonSerializable()
class DrinkListModel {
  final List<DrinkModel> drinks;

  DrinkListModel({required this.drinks});
 factory DrinkListModel.fromJson(Map<String, dynamic> json) =>
      _$DrinkListModelFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkListModelToJson(this);

}