import 'package:six_exam/data/model/card_model.dart';

abstract class CardState {}

class CardsInitial extends CardState {}

class CardsLoadInProgress extends CardState {}

class CardsLoadInSuccess extends CardState {
  CardsLoadInSuccess({required this.cardModel});

  final List<CardModel> cardModel;
}

class CardsLoadInEmpty extends CardState {
  CardsLoadInEmpty({required this.empty});

  final String empty;
}
