import 'package:flix_id/presentation/extensions/build_context_extensions.dart';
import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flix_id/presentation/pages/movie_page/movie_page.dart';
import 'package:flix_id/presentation/pages/profile_page/profile_page.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/bottom_navbar.dart';
import 'package:flix_id/presentation/widgets/bottom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final PageController _pageController = PageController();
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (previous != null && next is AsyncData && next.value == null) {
        ref.read(routerProvider).goNamed("login");
      } else if (next is AsyncError) {
        context.showSnackBar(next.error.toString());
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedPage = index;
              });
            },
            children: const [
              Center(child: MoviePage()),
              Center(child: Text("Ticket Page")),
              Center(child: ProfilePage()),
            ],
          ),
          BottomNavBar(
            items: [
              BottomNavBarItem(
                index: 0,
                isSelected: _selectedPage == 0,
                title: "Home",
                image: "assets/movie.png",
                selectedImage: "assets/movie-selected.png",
              ),
              BottomNavBarItem(
                index: 1,
                isSelected: _selectedPage == 1,
                title: "Ticket",
                image: "assets/ticket.png",
                selectedImage: "assets/ticket-selected.png",
              ),
              BottomNavBarItem(
                index: 2,
                isSelected: _selectedPage == 2,
                title: "Profile",
                image: "assets/profile.png",
                selectedImage: "assets/profile-selected.png",
              ),
            ],
            onTap: (index) {
              setState(() {
                _selectedPage = index;
                _pageController.animateToPage(
                  _selectedPage,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              });
            },
            selectedIndex: 0,
          )
        ],
      ),
    );
  }
}
