import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_app/business_logic/cubit/character_cubit.dart';
import 'package:rick_morty_app/constants/my_colors.dart';
import 'package:rick_morty_app/data/models/charcter.dart';
import 'package:rick_morty_app/presentaion/widgets/character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Character> allCharacters ;
  @override
  void initState() {
    super.initState();
    allCharacters=BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  Widget _buildBlocWidget (){
    return BlocBuilder<CharacterCubit,CharacterState>(builder: (context,state){
      if(state is CharacterLoaded){
        allCharacters=(state).characters ;
        return buildLoadedList();
      }else{
        return showLoadedIndicator();
      }
    },);
  }

  Widget buildLoadedList (){
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildGridCharacters()
          ],
        ),
      ),
    );
  }

  Widget buildGridCharacters(){
    return GridView.builder(
      itemCount: allCharacters.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/3,crossAxisSpacing: 1,mainAxisSpacing: 1), itemBuilder: (context,index){
        return CharacterItem();
      });


  }

  Widget showLoadedIndicator (){
    return Center(child: CircularProgressIndicator(
      color: MyColors.myYellow,
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: Text('Characters',style: TextStyle(
          color: MyColors.myGrey
        ),),
      ),
            body: _buildBlocWidget(),

    );
  }
}