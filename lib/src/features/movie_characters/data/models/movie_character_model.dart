import 'package:movie_characters_app/src/features/movie_characters/domain/entities/movie_characters_entity.dart';

class MovieCharacterModel extends MovieCharacterEntity {
  MovieCharacterModel();

  factory MovieCharacterModel.fromJson(Map<String, Object?> json) =>
      MovieCharacterModel();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
