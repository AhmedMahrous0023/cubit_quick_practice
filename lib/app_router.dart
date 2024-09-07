import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_app/business_logic/cubit/character_cubit.dart';
import 'package:rick_morty_app/constants/strings.dart';
import 'package:rick_morty_app/data/repository/character_repository.dart';
import 'package:rick_morty_app/data/web_services/character_web_services.dart';
import 'package:rick_morty_app/presentaion/screens/character_details_screen.dart';
import 'package:rick_morty_app/presentaion/screens/character_screen.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharacterCubit characterCubit;

  AppRouter() {
    characterRepository = CharacterRepository(CharacterWebServices());
    characterCubit = CharacterCubit(characterRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                     characterCubit,
                  child: CharacterScreen(),
                ));

      case characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(),
                );
    }
    return null;
  }
}
