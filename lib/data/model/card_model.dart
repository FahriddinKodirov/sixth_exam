class UserFields {
  static String id = "id";
  static String cardNumber = "cardNumber";
  static String cardTime = "cardTime";
  static String cardName = "cardName";
  static String cardColor = "cardColor";
  static String cardImage = "cardImage";
}

class CardModel{
  final int? id;
  final String cardNumber;
  final String cardTime;
  final String cardName;
  final String cardColor;
  final String cardImage;

  CardModel({
     this.id,
     required this.cardNumber,
     required this.cardTime,
     required this.cardName,
     required this.cardColor,
     required this.cardImage,
  });

  factory CardModel.fromJson(Map<String, dynamic> json){
    return CardModel(
        id: json['id']  as int? ?? 0, 
        cardNumber: json['cardNumber']  as String? ?? '', 
        cardTime: json['cardTime']  as String? ?? '', 
        cardName: json['cardName']  as String? ?? '', 
        cardColor: json['cardColor']  as String? ?? '', 
        cardImage: json['cardImage']  as String? ?? '', 
        );
  }

  Map<String, dynamic> toJson() => {
        UserFields.id: id,
        UserFields.cardNumber: cardNumber,
        UserFields.cardTime: cardTime,
        UserFields.cardName: cardName,
        UserFields.cardColor: cardColor,
        UserFields.cardImage: cardImage,
      };
  
   CardModel copyWith({
    int? id,
    String? cardNumber,
    String? cardTime,
    String? cardName,
    String? cardColor,
    String? cardImage,
  }) {
    return CardModel(
      id: id ?? this.id,
      cardNumber: cardNumber ?? this.cardNumber,
      cardTime: cardTime ?? this.cardTime,
      cardName: cardName ?? this.cardName,
      cardColor: cardColor ?? this.cardColor,
      cardImage: cardImage ?? this.cardImage,
    );
  }
}