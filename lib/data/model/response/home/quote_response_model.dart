import 'package:day7_demo/domain/entities/home/quotes_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote_response_model.g.dart';

@JsonSerializable()
class QuotesResponseModel extends QuoteEntity {
  const QuotesResponseModel({
    required super.id,
    required super.quote,
    required super.author,
  });

  Map<String, dynamic> toJson() => _$QuotesResponseModelToJson(this);

  factory QuotesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuotesResponseModelFromJson(json);
}
