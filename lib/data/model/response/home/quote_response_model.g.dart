// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuotesResponseModel _$QuotesResponseModelFromJson(Map<String, dynamic> json) =>
    QuotesResponseModel(
      id: json['id'] as int?,
      quote: json['quote'] as String?,
      author: json['author'] as String?,
    );

Map<String, dynamic> _$QuotesResponseModelToJson(
        QuotesResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quote': instance.quote,
      'author': instance.author,
    };
