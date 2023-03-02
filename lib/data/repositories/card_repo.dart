import 'package:six_exam/data/local_db/database/sqlflite.dart';
import 'package:six_exam/data/model/card_model.dart';

class CardRepo {
  Future<CardModel> insertCard(CardModel cardModel) =>
      LocalDatabase.insertCard(cardModel: cardModel);
  
  Future<List<CardModel>> getCard() => LocalDatabase.getCard();

  Future<int> deleteTaskById(id) => LocalDatabase.deleteTaskById(id);


  Future<CardModel> updateTaskById(cardModel) => LocalDatabase.updateTaskById(cardModel);
}