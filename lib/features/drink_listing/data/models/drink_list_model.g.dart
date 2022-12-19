// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkListModel _$DrinkListModelFromJson(Map<String, dynamic> json) =>
    DrinkListModel(
      drinks: (json['drinks'] as List<dynamic>)
          .map((e) => DrinkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrinkListModelToJson(DrinkListModel instance) =>
    <String, dynamic>{
      'drinks': instance.drinks,
    };
