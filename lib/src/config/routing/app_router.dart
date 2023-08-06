import 'package:movie_characters_app/src/features/movie_characters/presentation/character_details/screens/movie_character_details.dart';
import 'package:movie_characters_app/src/features/movie_characters/presentation/characters_list/screens/movie_characters_list_screen.dart';

enum AppRoute {
  home('/'),
  details('details'),
  splash('splash');

  const AppRoute(this.path);

  final String path;
}

final appRouter = {
  AppRoute.home.path: (context) => const MovieCharactersList(),
  AppRoute.details.path: (context) => const MovieCharacterDetails(),
};
