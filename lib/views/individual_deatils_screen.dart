import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../theme/styles.dart';
import '../utils/constants.dart';
import '../widgets/bullet_indicator.dart';
import '../widgets/popular_meetup_event_item.dart';

class TopTrendDetailsScreen extends StatefulWidget {
  const TopTrendDetailsScreen({super.key});

  @override
  State<TopTrendDetailsScreen> createState() => _TopTrendDetailsScreenState();
}

class _TopTrendDetailsScreenState extends State<TopTrendDetailsScreen> {
  final _searchController = TextEditingController();

  final _searchFocusNode = FocusNode();

  final _buttonCarouselController = CarouselController();

  void _onPressSeeMore(BuildContext context) {
    // do nothing
  }

  int _selectedIndex = 0;
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0), // here the desired height
        child: AppBar(
            title: const Text(
              'Description',
              style: Styles.headline1,
            ),
            centerTitle: false),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: images
                  .map(
                    (item) => PopularMeetupsEventItem(url: item),
                  )
                  .toList(),
              carouselController: _buttonCarouselController,
              options: CarouselOptions(
                  height: 400.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  viewportFraction: 0.97,
                  onPageChanged: (index, reason) => _onItemTapped(index)),
            ),
            BulletIndicator(current: _selectedIndex, total: images.length),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.bookmark_outline),
                      Text('1034'),
                      SizedBox(width: 20),
                      Icon(Icons.favorite_border_outlined),
                      Text('1034'),
                      SizedBox(width: 20),
                      Icon(Icons.star_outlined),
                      Icon(Icons.star_outlined),
                      Icon(Icons.star_outlined),
                      Icon(Icons.star_half_outlined),
                      Icon(Icons.star_border_outlined),
                      SizedBox(width: 8),
                      Text('3.5'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Actor name",
                    style: Styles.headline3,
                  ),
                  Text("Indian actress"),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Icon(Icons.timer_outlined),
                        Text("Mumbai, India"),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.money_outlined),
                      Text("Mumbai, India"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
