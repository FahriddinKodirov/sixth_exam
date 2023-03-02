import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:six_exam/bloc/card_bloc.dart';
import 'package:six_exam/bloc/card_event.dart';
import 'package:six_exam/data/local_db/database/sqlflite.dart';
import 'package:six_exam/data/model/card_model.dart';
import 'package:six_exam/data/model/color_model.dart';
import 'package:six_exam/provider/theme_cubit.dart';
import 'package:six_exam/screen/home/home_page.dart';
import 'package:six_exam/utils/my_utils.dart';

class UpdatePage extends StatefulWidget {
  final CardModel data;

  const UpdatePage({super.key, required this.data});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userController = TextEditingController();


  @override
  void initState() {
    numberController.text = widget.data.cardNumber.toString();
    nameController.text = widget.data.cardName.toString();
    timeController.text = widget.data.cardTime.toString();
    userController.text = widget.data.cardColor.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isLight = context.watch<ThemeProvider>().getIsLight();
    return Scaffold(
      backgroundColor: isLight?const Color(0xFF044767):Colors.white,
      appBar: AppBar(title: Text('Upadate'),
        backgroundColor: isLight?const Color(0xFF044767):Colors.red,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height(context) * 0.024),
              child: 
             Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label('User name'),
                 TextFormField(
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
                    obscuringCharacter: '*',
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
                  controller: nameController,
                  decoration: getInputDecoration(label: 'Kartanig nomi',light:isLight),
                  cursorHeight: 22,
                ),
                SizedBox(
                  height: height(context) * 0.03,
                ),
                InkWell(
                  onTap: () {
                    CardModel cardModel = CardModel(
                        cardNumber: numberController.text,
                        cardName: nameController.text,
                        cardTime: timeController.text,
                        cardColor: userController.text,
                        cardImage: widget.data.cardImage,
                        id: widget.data.id
                        );
                        GradientModel gradientModel = GradientModel(
                          id: '', 
                          gradient: [Colors.red,Colors.amber]);
                    BlocProvider.of<CardBloc>(context).add(UpdateCard(cardModel: cardModel));
                   Navigator.push(context, MaterialPageRoute(builder: (_)=> const HomePage()));
                  },
                      child: Container(
                        height: height(context) * 0.07,
                        width: width(context),
                        decoration: BoxDecoration(
                            color: isLight?Colors.black54:Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                            child: Text(
                          'Tayyor',
                          style: TextStyle(color: Colors.white38, fontSize: 18),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  label(word) {
    return Padding(
      padding: EdgeInsets.only(left: width(context) * 0.04),
      child: SizedBox(
        height: height(context) * 0.03,
        child: Text(
          word,
          style: TextStyle(color: Colors.black54, fontSize: 16),
        ),
      ),
    );
  }
}