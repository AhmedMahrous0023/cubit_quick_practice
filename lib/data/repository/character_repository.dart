import 'package:rick_morty_app/data/models/charcter.dart';
import 'package:rick_morty_app/data/web_services/character_web_services.dart';

class CharacterRepository {

final CharacterWebServices characterWebServices ;
CharacterRepository(this.characterWebServices);

Future <List<Character>> getAllCharacters()async{
  final character = await characterWebServices.getAllCharacters();
  return character.map((character) =>  Character.fromjson(character)).toList();
}
}