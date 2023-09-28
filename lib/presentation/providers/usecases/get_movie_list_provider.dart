import 'package:flix_id/domain/usecases/get_movie_list/get_movie_list.dart';
import 'package:flix_id/presentation/providers/repositories/movie_repository/movie_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_list_provider.g.dart';

@riverpod
GetMovieList getMovieList(GetMovieListRef ref) => GetMovieList(
      movieRepository: ref.watch(movieRepositoryProvider),
    );
