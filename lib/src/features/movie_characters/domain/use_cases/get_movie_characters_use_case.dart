import 'package:movie_characters_app/src/core/resources/data_state.dart';
import 'package:movie_characters_app/src/core/use_cases/base_use_case.dart';
import 'package:movie_characters_app/src/features/movie_characters/domain/entities/movie_characters_entity.dart';
import 'package:movie_characters_app/src/features/movie_characters/domain/repository/movie_characters_repository_contract.dart';

class GetMovieCharactersUseCase
    implements
        BaseUseCase<Future<DataState<List<MovieCharacterEntity>>>, void> {
  GetMovieCharactersUseCase(this._charactersRepository);

  final MovieCharactersRepositoryContract _charactersRepository;

  @override
  Future<DataState<List<MovieCharacterEntity>>> execute({void param}) =>
      _charactersRepository.getMovieCharacters();
}
