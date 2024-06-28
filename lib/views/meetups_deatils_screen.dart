import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../theme/styles.dart';
import '../utils/constants.dart';
import '../widgets/app_search_bar.dart';
import '../widgets/bullet_indicator.dart';
import '../widgets/popular_meetup_event_item.dart';

class MeetupDetailsScreen extends StatelessWidget {
  MeetupDetailsScreen({super.key});

  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  final _buttonCarouselController = CarouselController();

  void _onPressSeeMore(BuildContext context) {
    // do nothing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0), // here the desired height
        child: AppBar(
            title: const Text(
              'Individual Meetup Details',
              style: Styles.headline1,
            ),
            centerTitle: false),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: AppSearchBar(
                searchController: _searchController,
                searchFocusNode: _searchFocusNode),
          ),
          const SizedBox(height: 20),
          CarouselSlider(
            items: images
                .map(
                  (item) => PopularMeetupsEventItem(url: item),
                )
                .toList(),
            carouselController: _buttonCarouselController,
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 2000),
              viewportFraction: 0.8,
            ),
          ),
          BulletIndicator(current: 0, total: images.length),
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              "Trending Popular People",
              style: Styles.headline2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 240,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.person),
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Author"),
                                    Text("1,028 Meetups"),
                                  ],
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Divider(color: Colors.grey),
                            ),
                            const Stack(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.person),
                                ),
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.person),
                                ),
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.person),
                                ),
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.person),
                                ),
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.person),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () => _onPressSeeMore(context),
                                  child: const Text('See more'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
