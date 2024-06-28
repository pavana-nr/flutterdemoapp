import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../theme/styles.dart';
import '../utils/constants.dart';
import '../widgets/app_search_bar.dart';
import '../widgets/bullet_indicator.dart';
import '../widgets/popular_meetup_event_item.dart';
import 'individual_deatils_screen.dart';

class MeetupDetailsScreen extends StatefulWidget {
  const MeetupDetailsScreen({super.key});

  @override
  State<MeetupDetailsScreen> createState() => _MeetupDetailsScreenState();
}

class _MeetupDetailsScreenState extends State<MeetupDetailsScreen> {
  final _searchController = TextEditingController();

  final _searchFocusNode = FocusNode();

  final _buttonCarouselController = CarouselController();

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0), // here the desired height
        child: AppBar(
            title: const Text(
              'Individual Meetup Details',
              style: Styles.headline1,
            ),
            centerTitle: false),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                viewportFraction: 0.8,
                onPageChanged: (index, reason) => _onItemTapped(index),
              ),
            ),
            BulletIndicator(current: _selectedIndex, total: images.length),
            TrendingPeople(),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                "Top Tranding Meetups",
                style: Styles.headline2,
              ),
            ),
            TopTrendingPeople(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class PeopleAvatar extends StatelessWidget {
  PeopleAvatar({
    super.key,
    required this.icon,
  });

  IconData icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24, // Adjust the radius for the size you want
      backgroundColor: Colors.grey, // A default color for the avatar
      child: Icon(icon),
    );
  }
}

class TopTrendingPeople extends StatelessWidget {
  TopTrendingPeople({
    super.key,
  });

  void _onPressTopTrendItem(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TopTrendDetailsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 240,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: GestureDetector(
                  onTap: () => _onPressTopTrendItem(context),
                  child: SizedBox(
                    width: 240,
                    height: 240,
                    child: Image(
                        image: NetworkImage(images[index]), fit: BoxFit.cover),
                  ),
                ),
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
        ),
      ),
    );
  }
}

class TrendingPeople extends StatelessWidget {
  TrendingPeople({
    super.key,
  });

  void _onPressSeeMore(BuildContext context) {
    // do nothing
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30, bottom: 10),
          child: Text(
            "Tranding Popular People",
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
                                radius:
                                    24, // Adjust the radius for the size you want
                                backgroundColor: Colors
                                    .grey, // A default color for the avatar
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
                          Row(
                            children: [
                              PeopleAvatar(icon: Icons.person),
                              PeopleAvatar(icon: Icons.person),
                              PeopleAvatar(icon: Icons.person),
                              PeopleAvatar(icon: Icons.person),
                            ],
                          ),
                          SizedBox(height: 24),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () => _onPressSeeMore(context),
                              child: const Text('See more'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: 3,
            ),
          ),
        ),
      ],
    );
  }
}
