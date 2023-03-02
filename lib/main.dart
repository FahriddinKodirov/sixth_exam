import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:six_exam/bloc/card_bloc.dart';
import 'package:six_exam/bloc/card_event.dart';
import 'package:six_exam/provider/theme_cubit.dart';
import 'package:six_exam/data/model/card_model.dart';
import 'package:six_exam/data/repositories/card_repo.dart';
import 'package:six_exam/screen/home/home_page.dart';
import 'package:six_exam/utils/my_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
          create: (_) => ThemeProvider())
        ],
      
    child: MultiBlocProvider(providers: [
       BlocProvider(create: (context) => CardBloc(CardRepo())..add(GetCard(id: 0))),
       BlocProvider(create: (context) => CardBloc(CardRepo())..add(AddCard(cardModel: CardModel(cardNumber: '', cardTime: '', cardName: '', cardColor: '', cardImage: '')))),
       BlocProvider(create: (context) => CardBloc(CardRepo())..add(UpdateCard(cardModel: CardModel(cardNumber: '', cardTime: '', cardName: '', cardColor: '', cardImage: '')))),
    ], child: const MyApp()),
  )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Styles.themeData(context.watch<ThemeProvider>().getIsLight(), context),
      themeMode: context.watch<ThemeProvider>().getIsLight()
      ? ThemeMode.dark
      : ThemeMode.light,
      home: const HomePage(),
    );
  }
}

