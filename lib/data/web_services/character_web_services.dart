
import 'package:dio/dio.dart';
import 'package:rick_morty_app/constants/strings.dart';

class CharacterWebServices{

  late Dio dio ;

  CharacterWebServices(){
    BaseOptions options =BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20) ,// 20seconds
      receiveTimeout: Duration(seconds: 20)
    ) ;
    dio =Dio(options);
  }

  Future<List<dynamic>> getAllCharacters ()async{
    try{
      Response response = await dio.get('character');
      print(response.data.toString());
      return response.data ;
    }catch(e){
      print(e.toString());
      return [];
    }
  }
  
}