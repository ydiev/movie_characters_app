import 'dart:io';
import 'package:dio/dio.dart';
import 'package:movie_characters_app/src/core/resources/data_state.dart';
import 'package:movie_characters_app/src/features/movie_characters/data/data_sources/remote/movie_characters_api_service.dart';
import 'package:movie_characters_app/src/features/movie_characters/data/models/movie_character_model.dart';
import 'package:movie_characters_app/src/features/movie_characters/domain/repository/movie_characters_repository_contract.dart';

class MovieCharacterRepository extends MovieCharactersRepositoryContract {
  MovieCharacterRepository(this._charactersApiService);

  final MovieCharactersApiService _charactersApiService;

  @override
  Future<DataState<List<MovieCharacterModel>>> getMovieCharacters() async {
    try {
      final httpResponse = await _charactersApiService.getMovieCharacters();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }
}
