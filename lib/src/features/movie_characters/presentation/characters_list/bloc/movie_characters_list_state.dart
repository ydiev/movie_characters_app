part of 'movie_characters_list_cubit.dart';

@freezed
class MovieCharactersListState with _$MovieCharactersListState {
  const factory MovieCharactersListState.initial() = _Initial;

  const factory MovieCharactersListState.loading() = _Loading;

  const factory MovieCharactersListState.loaded(
    List<MovieCharacterEntity> movieCharacters,
  ) = _Loaded;

  const factory MovieCharactersListState.error(DioException exception) =
      _Exception;
}
