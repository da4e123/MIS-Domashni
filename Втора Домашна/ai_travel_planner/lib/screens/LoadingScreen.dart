import 'package:ai_travel_planner/screens/GeneratedTrip.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  final String destinationName;
  final String travelType;
  final String imagePath;
  final String cityImage;
  final String travelDates;
  final int totalDays;

  // Конструктор кој прифаќа параметри
  LoadingScreen({
    required this.destinationName,
    required this.travelType,
    required this.imagePath,
    required this.cityImage,
    required this.totalDays,
    required this.travelDates
  });

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    // Delay for 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GeneratedTrip(
            destinationName: widget.destinationName,
              travelDates: widget.travelDates,
            travelType: widget.travelType,
            imagePath: widget.imagePath,
            cityImage: widget.cityImage,
            totalDays: widget.totalDays
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Please Wait...',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'We are working to generate your dream trip',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Image.asset(
                'images/plane_gif.jpg', // Патека до сликата
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Do not Go Back',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
