import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/get_movie_list/get_movie_list.dart';
import 'package:flix_id/domain/usecases/get_movie_list/get_movie_list_params.dart';
import 'package:flix_id/presentation/providers/usecases/get_movie_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod/riverpod.dart';

part 'now_playing_provider.g.dart';

@Riverpod(keepAlive: true)
class NowPlaying extends _$NowPlaying {
  @override
  FutureOr<List<Movie>> build() => const [];

  Future<void> getMovies({int page = 1}) async {
    state = const AsyncLoading();

    GetMovieList getMovieList = ref.read(getMovieListProvider);

    var result = await getMovieList(
      GetMovieListParams(
        page: page,
        category: MovieListCategories.nowPlaying,
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
