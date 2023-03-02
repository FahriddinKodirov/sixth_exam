import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:six_exam/provider/theme_cubit.dart';
import 'package:six_exam/screen/home/home_page.dart';
import 'package:six_exam/screen/home/widget/add/text_field_widget.dart';
import 'package:six_exam/screen/home/widget/color/color_widget.dart';
import 'package:six_exam/utils/my_utils.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int imageIndex = 0;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    var isLight = context.watch<ThemeProvider>().getIsLight();
    return Scaffold(
      backgroundColor: isLight?const Color(0xFF044767):Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: isLight?Colors.red:Colors.black,)),
        title: Text('Add card',style: TextStyle(color: isLight?Colors.white:Colors.black),),
        elevation: 0,
        backgroundColor: isLight?const Color(0xFF044767):Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width(context) * 0.03),
              child: SizedBox(
                height: height(context) * 0.28,
                width: width(context),
                child: PageView.builder(
                  itemCount: cardPhoto.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      radius: 0,
                      onTap: () {
                        setState(() {
                        });
                       isTrue = !isTrue;
                       imageIndex = index;
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: width(context)*0.03,right: width(context)*0.03),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  opacity: imageIndex == index && isTrue == false?0.5:1.0,
                                  image: AssetImage(
                                    cardPhoto[index],
                                  ),
                                  fit: BoxFit.contain),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const ColorWidget(),
            TextFieldWidget(index: imageIndex,),
          ],
        ),
      ),
    );
  }

  
}
