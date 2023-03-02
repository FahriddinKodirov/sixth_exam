import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:six_exam/bloc/card_bloc.dart';
import 'package:six_exam/bloc/card_event.dart';
import 'package:six_exam/data/model/card_model.dart';
import 'package:six_exam/provider/theme_cubit.dart';
import 'package:six_exam/screen/home/widget/update_page.dart';
import 'package:six_exam/utils/my_utils.dart';

class CardWidget extends StatelessWidget {
  final CardModel data;

  const CardWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var isLight = context.watch<ThemeProvider>().getIsLight();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: height(context) * 0.26,
        width: width(context),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  data.cardImage,
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height(context) * 0.036,
              ),
              Text(
                data.cardNumber,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                height: height(context) * 0.022,
              ),
             Text(data.cardTime,
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(
                height: height(context) * 0.022,
              ),
             Text('${data.cardName} CARD',
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(
                height: height(context) * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data.cardColor,
                      style: const TextStyle(color: Colors.white, fontSize: 18)),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> UpdatePage(data: data)));
                      }, icon: const Icon(Icons.edit,color: Colors.white,)),
                       IconButton(onPressed: (){
                        showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor:isLight?Colors.blueGrey:Colors.white,
                      title: const Text('Delete'),
                      content: SizedBox(
                        height: height(context)*0.12,
                        width: width(context),
                        child: Column(
                          children: [
                            const Text('ishonchingiz  komilmi',style: TextStyle(fontSize: 20),),
                            SizedBox(height: height(context)*0.02,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(onPressed: (){
                                    Navigator.pop(context);
                                }, child: const Text('yoq')),
                                ElevatedButton(onPressed: (){
                                 BlocProvider.of<CardBloc>(context).add(GetCard(id: data.id!));
                                Navigator.pop(context);
                            }, child: const Text('ha'))
                              ],
                            ),
                            
                          ],
                        ),
                      )
                    );
                       
                       });
                  }, icon: const Icon(Icons.delete,color: Colors.red,)),
                    ],
                  ),
                 
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
