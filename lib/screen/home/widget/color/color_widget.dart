import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:six_exam/utils/my_utils.dart';

class ColorWidget extends StatefulWidget {
  const ColorWidget({super.key});

  @override
  State<ColorWidget> createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width(context) * 0.024),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height(context) * 0.06,
              width: height(context) * 0.06,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                      colors: [cardColor[3], cardColor[4], cardColor[5]]),
                  shape: BoxShape.circle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height(context) * 0.06,
              width: height(context) * 0.06,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                      colors: [cardColor[0], cardColor[1], cardColor[2]]),
                  shape: BoxShape.circle),
            ),
          ),
          selectColor(context, 4, 5),
          selectColor(context, 6, 7),
          SizedBox(
            width: width(context) * 0.03,
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: pickerColor,
                          onColorChanged: changeColor,
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          child: const Text('Got it'),
                          onPressed: () {
                            setState(() => currentColor = pickerColor);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            },
            child: Container(
              height: height(context) * 0.06,
              width: width(context) * 0.2,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/color.png'), scale: 3.8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.green,
                        offset: Offset(1, 1),
                        blurRadius: 2,
                        spreadRadius: 3)
                  ]),
            ),
          )
        ],
      ),
    );
  }

  selectColor(
    context,
    one,
    two,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height(context) * 0.06,
        width: height(context) * 0.06,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [cardColor[0], cardColor[4], cardColor[1]]),
            shape: BoxShape.circle),
      ),
    );
  }
}
