import 'package:flix_id/data/repositories/movie_repository.dart';
import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/get_movie_list/get_movie_list_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class GetMovieList implements UseCase<Result<List<Movie>>, GetMovieListParams> {
  final MovieRepository _movieRepository;

  GetMovieList({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<Movie>>> call(GetMovieListParams params) async {
    final movieResult = switch (params.category) {
      MovieListCategories.nowPlaying =>
        await _movieRepository.getNowPlaying(page: params.page),
      MovieListCategories.upcoming =>
        await _movieRepository.getUpcoming(page: params.page),
    };

    return switch (movieResult) {
      Success(value: final movie) => Result.success(movie),
      Failed(:final message) => Result.failed(message)
    };
  }
}
