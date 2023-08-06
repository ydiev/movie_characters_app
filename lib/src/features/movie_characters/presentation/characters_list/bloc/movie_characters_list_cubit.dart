import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_characters_app/src/core/resources/data_state.dart';
import 'package:movie_characters_app/src/features/movie_characters/domain/entities/movie_characters_entity.dart';
import 'package:movie_characters_app/src/features/movie_characters/domain/use_cases/get_movie_characters_use_case.dart';

part 'movie_characters_list_state.dart';

part 'movie_characters_list_cubit.freezed.dart';

class MovieCharactersListCubit extends Cubit<MovieCharactersListState> {
  MovieCharactersListCubit(
    this._getMovieCharactersUseCase,
  ) : super(const MovieCharactersListState.initial());
  final GetMovieCharactersUseCase _getMovieCharactersUseCase;

  void fetchMovieCharacters() async {
    final dataState = await _getMovieCharactersUseCase.execute();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      final data = dataState.data!;
      emit(MovieCharactersListState.loaded(data));
    }
    if (dataState is DataFailed && dataState.exception != null) {
      emit(MovieCharactersListState.error(dataState.exception!));
    }
  }
}
