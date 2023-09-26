enum MovieListCategories {
  nowPlaying,
  upcoming,
}

class GetMovieListParams {
  final MovieListCategories category;
  final int page;

  GetMovieListParams({
    required this.category,
    this.page = 1,
  });
}
