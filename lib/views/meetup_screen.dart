import 'package:flutter/material.dart';

import 'meetups_deatils_screen.dart';

class MeetupScreen extends StatelessWidget {
  const MeetupScreen({super.key});

  void _onPressDetailsButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MeetupDetailsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meetup'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Meetup Screen"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _onPressDetailsButton(context),
              child: const Text('Go to Details'),
            ),
          ],
        ),
      ),
    );
  }
}
