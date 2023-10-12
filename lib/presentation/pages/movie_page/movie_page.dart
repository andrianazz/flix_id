import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flix_id/presentation/pages/movie_page/methods/movie_list.dart';
import 'package:flix_id/presentation/pages/movie_page/methods/promotion_list.dart';
import 'package:flix_id/presentation/pages/movie_page/methods/search_bar.dart';
import 'package:flix_id/presentation/pages/movie_page/methods/user_info.dart';
import 'package:flix_id/presentation/providers/movie/now_playing_provider.dart';
import 'package:flix_id/presentation/providers/movie/upcoming_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviePage extends ConsumerWidget {
  final List<String> promotionImageFileNames = const [
    'popcorn.jpb',
    'buy1get1.jpg',
  ];
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Column(
          children: [
            userInfo(ref),
            verticalSpace(40),
            searchBar(context),
            ...movieList(
              title: "Now Playing",
              movies: ref.watch(nowPlayingProvider),
              onTap: (movie) {
                //Go to Movie Page
              },
            ),
            ...promotionList(promotionImageFileNames),
            ...movieList(
              title: "Upcoming",
              movies: ref.watch(upcomingProvider),
              onTap: (movie) {
                //Go to Movie Page
              },
            ),
          ],
        )
      ],
    );
  }
}
