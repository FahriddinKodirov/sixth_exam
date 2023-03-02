import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:six_exam/data/model/color_model.dart';
import 'package:six_exam/utils/my_utils.dart';

class CategoriesRepository {
  final FirebaseFirestore _firestore;

  CategoriesRepository({required FirebaseFirestore firebaseFirestore})
       :_firestore = firebaseFirestore;
    
 Future<void> addColor({required GradientModel gradientModel}) async {
  try {
    DocumentReference newId =
       await _firestore.collection('colors').add(gradientModel.toJson());
       await _firestore.collection('colors').doc(newId.id).update({
        'id': newId.id,
       });
       MyUtils.getMyToast(message: "Kategorya muvaffaqiyatli qo'shildi!");
    } on FirebaseException catch(error){
       MyUtils.getMyToast(message: error.message.toString());
   }
  }

  Future<void> deleteColor({required String docId}) async {
    try {
      await _firestore.collection('colors').doc(docId).delete();
      MyUtils.getMyToast(message: "Kategorya muvaffaqiyatli qo'shildi!");
    } on FirebaseException catch(error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }


Future<void> updateCategory({required GradientModel gradientModel}) async {
  try {
    await _firestore
         .collection('colors')
         .doc(gradientModel.id)
         .update(gradientModel.toJson());
        MyUtils.getMyToast(message: "Kategorya muvaffaqiyatli yangilandi!");
  } on FirebaseException catch(error) {
    MyUtils.getMyToast(message: error.message.toString());
  }
}
   Stream<List<GradientModel>> getCategories() =>
      _firestore.collection('colors')
      .snapshots().map((event) => event.docs
      .map((doc) => GradientModel.fromJson(doc.data()))
      .toList()
      );
}
