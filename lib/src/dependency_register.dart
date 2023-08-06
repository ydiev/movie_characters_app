import 'package:dio/dio.dart';
import 'package:dotenv/dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_characters_app/src/core/utils/constants.dart';
import 'package:movie_characters_app/src/features/movie_characters/data/data_sources/remote/movie_characters_api_service.dart';
import 'package:movie_characters_app/src/features/movie_characters/data/repository/movie_character_repository.dart';
import 'package:movie_characters_app/src/features/movie_characters/domain/repository/movie_characters_repository_contract.dart';
import 'package:movie_characters_app/src/features/movie_characters/domain/use_cases/get_movie_characters_use_case.dart';
import 'package:movie_characters_app/src/features/movie_characters/presentation/characters_list/bloc/movie_characters_list_cubit.dart';

final getIt = GetIt.instance;

final env = DotEnv()..load();
final apiBaseUrl = env[dataApiEnvKey] ?? '';

void registerDependencies() {
  final dio = Dio();

  getIt.registerSingleton<Dio>(dio);

  getIt.registerLazySingleton<MovieCharactersApiService>(
    () => MovieCharactersApiService(getIt(), baseUrl: apiBaseUrl),
  );
  getIt.registerLazySingleton<MovieCharactersRepositoryContract>(
    () => MovieCharacterRepository(getIt()),
  );
  getIt.registerLazySingleton<GetMovieCharactersUseCase>(
    () => GetMovieCharactersUseCase(getIt()),
  );
  getIt.registerFactory<MovieCharactersListCubit>(
    () => MovieCharactersListCubit(getIt()),
  );
}
