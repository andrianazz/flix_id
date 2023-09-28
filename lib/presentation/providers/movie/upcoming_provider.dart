import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/get_movie_list/get_movie_list.dart';
import 'package:flix_id/domain/usecases/get_movie_list/get_movie_list_params.dart';
import 'package:flix_id/presentation/providers/usecases/get_movie_list_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upcoming_provider.g.dart';

@Riverpod(keepAlive: true)
class Upcoming extends _$Upcoming {
  @override
  FutureOr<List<Movie>> build() => const [];

  Future<void> getMovies({int page = 1}) async {
    state = const AsyncLoading();

    GetMovieList getMovieList = ref.read(getMovieListProvider);

    var result = await getMovieList(
      GetMovieListParams(
        page: page,
        category: MovieListCategories.upcoming,
      ),
    );

    switch (result) {
      case Success(value: final movies):
        state = AsyncData(movies);

      case Failed(message: final _):
        state = const AsyncData([]);
    }
  }
}
