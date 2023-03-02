import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:six_exam/bloc/card_bloc.dart';
import 'package:six_exam/bloc/card_event.dart';
import 'package:six_exam/data/model/card_model.dart';
import 'package:six_exam/data/model/color_model.dart';
import 'package:six_exam/provider/theme_cubit.dart';
import 'package:six_exam/screen/home/home_page.dart';
import 'package:six_exam/utils/my_utils.dart';

class TextFieldWidget extends StatefulWidget {
  final int index;

  const TextFieldWidget({super.key, required this.index});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userController = TextEditingController();

  String box = '';


  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    var isLight = context.watch<ThemeProvider>().getIsLight();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: height(context) * 0.024),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label('User name'),
                 TextFormField(
                  validator: (name) =>
                    name != null && name.length < 3
                          ? 'toliq kiriting'
                          : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: userController,
                  decoration: getInputDecoration(label: 'User name',light:isLight),
                  cursorHeight: 22,
                ),
                SizedBox(height: height(context) * 0.02),
                label('Kartanig raqami'),
                TextFormField(
                  onChanged: (value) {
                      value = 1.toString();
                  },
                  controller: numberController,
                    validator: (value) => value != null && value.length < 16
                        ? 'Toliq kiriting'
                        : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorHeight: 22,
                    decoration: getInputDecoration(label: 'Kartanig raqami',light:isLight)),
                SizedBox(height: height(context) * 0.022),
                label('Amal qilish muddati'),
                TextFormField(
                    validator: (value) =>
                        value != null && value.length < 1/23? 'yangi oyni kiriting' : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorHeight: 22,
                    controller: timeController,
                    decoration:
                        getInputDecoration(label: 'Amal qilish muddati',light:isLight)),
                SizedBox(height: height(context) * 0.022),
                label('Kartanig nomi'),
                TextFormField(
                  validator: (name) =>
                    name != null && name.length < 3
                          ? 'toliq kiriting'
                          : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: nameController,
                  decoration: getInputDecoration(label: 'Kartanig nomi',light:isLight),
                  cursorHeight: 22,
                ),
                SizedBox(
                  height: height(context) * 0.03,
                ),
                InkWell(
                  onTap: () {
                    final isValid = formKey.currentState!.validate();
                    if (!isValid) return;
                    CardModel cardModel = CardModel(
                        cardNumber: numberController.text,
                        cardName: nameController.text,
                        cardTime: timeController.text,
                        cardColor: userController.text,
                        cardImage: cardPhoto[widget.index]
                        );
                        GradientModel gradientModel = GradientModel(
                          id: '', 
                          gradient: [Colors.red,Colors.amber]);
                          
                        
                    BlocProvider.of<CardBloc>(context).add(AddCard(cardModel: cardModel));
                   Navigator.push(context, MaterialPageRoute(builder: (_)=> const HomePage()));
                  },
                  child: Container(
                    height: height(context) * 0.07,
                    width: width(context),
                    decoration: BoxDecoration(
                        color: isLight?Colors.white54:Colors.black54,
                        borderRadius: BorderRadius.circular(20)),
                    child:  Center(
                        child: Text(
                      'Tayyor',
                      style: TextStyle(color:isLight?Colors.white54:Colors.black, fontSize: 18),
                    )),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.04,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  label(word) {
    return Padding(
      padding: EdgeInsets.only(left: width(context) * 0.04),
      child: SizedBox(
        height: height(context) * 0.03,
        child: Text(
          word,
          style: const TextStyle(color: Colors.black54, fontSize: 16),
        ),
      ),
    );
  }

}
