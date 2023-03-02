import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:six_exam/bloc/card_bloc.dart';
import 'package:six_exam/bloc/card_state.dart';
import 'package:six_exam/provider/theme_cubit.dart';
import 'package:six_exam/screen/home/widget/add/add_screen.dart';
import 'package:six_exam/screen/home/widget/card_widget.dart';
import 'package:six_exam/screen/home/widget/into/info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    var isLight = context.watch<ThemeProvider>().getIsLight();
    var themeChanger = Provider.of<ThemeProvider>(context);
    return Scaffold(
        backgroundColor: isLight?const Color(0xFF044767):Colors.white,
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: isLight? const Color(0xFF044767):Colors.red,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const AddPage()));
                },
                icon: Icon(Icons.add,color: isLight? Colors.white:Colors.black,)),
              IconButton(
                onPressed: () {
                 setState(() {
                   isLight = !isLight;
                 });
                 themeChanger.setIsLight(isLight);
                },
                icon: Icon(Icons.light_mode,color: isLight? Colors.red:Colors.black,))
          ],
          elevation: 0,
          centerTitle: true,
          backgroundColor: isLight?const Color(0xFF044767):Colors.white,
          title: Text('Barja cartalar',style: TextStyle(color: isLight? Colors.white:Colors.black,),),
        ),
        body: BlocBuilder<CardBloc, CardState>(builder: (context, state) {
          if (state is CardsLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CardsLoadInEmpty) {
            return  Center(
                child: Icon(
              Icons.file_copy_outlined,
              color: Colors.grey[200],
              size: 200,
            ));
          } else if (state is CardsLoadInSuccess) {
            return ListView.builder(
                itemCount: state.cardModel.length,
                itemBuilder: (context, index) {
                  var date = state.cardModel[index];
                  return InkWell(
                      onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> const InFoPage()));
                      },
                      child: CardWidget(data: date));
                });
          }
          return const SizedBox();
        }));
  }
}
