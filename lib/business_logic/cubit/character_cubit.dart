import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_app/data/models/charcter.dart';
import 'package:rick_morty_app/data/repository/character_repository.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository characterRepository ;
    List <Character> characters =[] ;
  CharacterCubit(this.characterRepository) : super(CharacterInitial());

  List<Character> getAllCharacters(){
    characterRepository.getAllCharacters().then((characters){
      emit(CharacterLoaded(characters));
      this.characters=characters ;

    });
    return characters ;
  }
}
