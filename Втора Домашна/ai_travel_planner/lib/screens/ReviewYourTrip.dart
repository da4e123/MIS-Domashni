import 'package:ai_travel_planner/screens/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:ai_travel_planner/widgets/InfoRow.dart';

class ReviewYourTrip extends StatelessWidget {
  final String destinationName;
  final String travelDates;
  final String travelType;
  final String budget;
  final String imagePath;
  final String iconOption;
  final String cityImage;
  final int totalDays;


  ReviewYourTrip({
    required this.destinationName,
    required this.travelDates,
    required this.travelType,
    required this.budget,
    required this.imagePath,
    required this.iconOption,
    required this.cityImage,
    required this.totalDays,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Review your trip",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Before generating your trip, please review your selection",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            InfoRow(imagePath: 'images/destination.jpg',
                label: "Destination",
                value: destinationName),
            SizedBox(height: 25), // Increased space
            InfoRow(imagePath: "images/calendar.jpg",
                label: "Travel Date",
                value: travelDates as String),
            SizedBox(height: 25),
            InfoRow(imagePath: 'images/friends.jpg',
                label: "Who is Traveling",
                value: travelType),
            SizedBox(height: 25),
            InfoRow(imagePath: iconOption,
                label: "Budget",
                value: budget),
            SizedBox(height: 60), // More space before the button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingScreen(
                        destinationName: destinationName,
                        travelDates: travelDates,
                        travelType: travelType,
                        imagePath: imagePath,
                        cityImage: cityImage,
                        totalDays: totalDays,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Build my Trip',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
