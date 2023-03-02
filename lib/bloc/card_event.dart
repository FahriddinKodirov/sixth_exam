import 'package:six_exam/data/model/card_model.dart';

abstract class CardEvent {}

class GetCard extends CardEvent {
  final int id;

  GetCard({required this.id});
}

class AddCard extends CardEvent {
  final CardModel cardModel;

  AddCard({required this.cardModel});
}

class UpdateCard extends CardEvent {
  final CardModel cardModel;

  UpdateCard({required this.cardModel});
}


