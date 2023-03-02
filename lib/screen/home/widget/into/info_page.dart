import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:six_exam/provider/theme_cubit.dart';

class InFoPage extends StatelessWidget {
  const InFoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isLight = context.watch<ThemeProvider>().getIsLight();
    return Scaffold(
        backgroundColor: isLight?const Color(0xFF044767):Colors.white,
      appBar: AppBar(
        title: const Text('Kartaning sozlamalari'),
        backgroundColor: isLight?const Color(0xFF044767):Colors.white,
      ),
      body: Column(children: const [
        ListTile(
          title: Text('Hamyonni toldirish'),
          leading: Icon(Icons.wallet),
        ),
        ListTile(
          title: Text('Hamyonni raqamini olish'),
          leading: Icon(Icons.format_list_numbered_outlined),
        ),
        
      ],),
    );
  }
}