import 'package:dio/dio.dart' hide Headers;
import 'package:movie_characters_app/src/features/movie_characters/data/models/movie_character_model.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_characters_api_service.g.dart';

@RestApi()
abstract class MovieCharactersApiService {
  factory MovieCharactersApiService(Dio dio, {String baseUrl}) =
      _MovieCharactersApiService;

  @GET('')
  Future<HttpResponse<List<MovieCharacterModel>>> getMovieCharacters();
}
