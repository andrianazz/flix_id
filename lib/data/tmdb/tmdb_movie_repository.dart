import 'package:dio/dio.dart';
import 'package:flix_id/data/repositories/movie_repository.dart';
import 'package:flix_id/domain/entities/actor.dart';
import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/domain/entities/result.dart';

class TmdbMovieRepository implements MovieRepository {
  final Dio? _dio;
  final String accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhM2RlODIzMWQ0MDlmMWYxMDhhMDVhYzcxYmJkZjhiMCIsInN1YiI6IjYwNDVjZWI4YzRhZDU5MDA0NGU3MTYxMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2NAO8E8WmINcHUxFUgtgwGxIiMtysEZTsOpl2z6ipR4";

  late final Options options = Options(headers: {
    'Authorization': 'Bearer $accessToken',
    'accept': 'application/json'
  });

  TmdbMovieRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<List<Actor>>> getActors({required int id}) async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/movie/$id/credits?language=en-US',
          options: options);

      final results = List<Map<String, dynamic>>.from(response.data['cast']);

      return Result.success(results.map((e) => Actor.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<MovieDetail>> getDetail({required int id}) async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/movie/$id?language=en-US',
          options: options);

      return Result.success(MovieDetail.fromJSON(response.data));
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) async =>
      _getMovies(category: _MovieCategory.nowPlaying, page: page);

  @override
  Future<Result<List<Movie>>> getUpcoming({int page = 1}) async =>
      _getMovies(category: _MovieCategory.upcoming, page: page);

  Future<Result<List<Movie>>> _getMovies(
      {required _MovieCategory category, int page = 1}) async {
    try {
      var response = await _dio!.get(
          'https://api.themoviedb.org/3/movie/${category.toString()}?language=en-U&page=$page',
          options: options);

      final result = List<Map<String, dynamic>>.from(response.data['results']);

      return Result.success(result.map((e) => Movie.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }
}

enum _MovieCategory {
  nowPlaying('now_playing'),
  upcoming('upcoming');

  final String _inString;

  const _MovieCategory(String inString) : _inString = inString;

  @override
  String toString() => _inString;
}
