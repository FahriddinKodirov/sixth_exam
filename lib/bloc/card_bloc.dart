import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:six_exam/bloc/card_event.dart';
import 'package:six_exam/bloc/card_state.dart';
import 'package:six_exam/data/model/card_model.dart';
import 'package:six_exam/data/repositories/card_repo.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
 final CardRepo cardRepo;

 CardBloc(this.cardRepo) : super(CardsInitial()) {
  on<GetCard>(_fetchDeleteCard);
  on<AddCard>(_fetchAddCard);
  on<UpdateCard>(_fetchUpdateCard);
 }

 _fetchDeleteCard(GetCard event, Emitter<CardState> emit) async {
   emit(CardsLoadInProgress());
      cardRepo.deleteTaskById(event.id);
      List<CardModel> cards = await cardRepo.getCard();
      if(cards.isNotEmpty) {
        emit(CardsLoadInSuccess(cardModel: cards));
      } else {
         emit(CardsLoadInEmpty(empty: 'Error'));
      }
 }
 _fetchAddCard(AddCard event, Emitter<CardState> emit) async {
   emit(CardsLoadInProgress());
    
      cardRepo.insertCard(event.cardModel);
      List<CardModel> cards = await cardRepo.getCard();
      if(cards.isNotEmpty) {
        emit(CardsLoadInSuccess(cardModel: cards));
      } else {
         emit(CardsLoadInEmpty(empty: 'Error'));
      }
 }
 _fetchUpdateCard(UpdateCard event, Emitter<CardState> emit) async {
   emit(CardsLoadInProgress());
      cardRepo.updateTaskById(event.cardModel);
      List<CardModel> cards = await cardRepo.getCard();
      if(cards.isNotEmpty) {
        emit(CardsLoadInSuccess(cardModel: cards));
      } else {
         emit(CardsLoadInEmpty(empty: 'Error'));
      }
 }

 

}