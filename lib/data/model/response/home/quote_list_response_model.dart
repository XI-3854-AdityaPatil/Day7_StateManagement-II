import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/home/quotes_entity.dart';

@JsonSerializable()
class QuoteListModel extends QuoteListEntity {
  const QuoteListModel({required super.quotes});

}