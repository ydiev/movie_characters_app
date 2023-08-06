import 'package:movie_characters_app/src/core/resources/data_state.dart';
import 'package:movie_characters_app/src/features/movie_characters/domain/entities/movie_characters_entity.dart';

abstract class MovieCharactersRepositoryContract {
  Future<DataState<List<MovieCharacterEntity>>> getMovieCharacters();
}
