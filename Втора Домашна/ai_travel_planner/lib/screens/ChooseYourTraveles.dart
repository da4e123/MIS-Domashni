import 'package:ai_travel_planner/models/Destination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ai_travel_planner/screens/Calendar.dart';
import 'package:ai_travel_planner/models/TravelOption.dart';

class ChooseYourTraveles extends StatefulWidget {

  final Destination destination;
  final String cityImage;

  ChooseYourTraveles({required this.destination, required this.cityImage});

  @override
  _TravelSelectionScreenState createState() => _TravelSelectionScreenState();
}

class _TravelSelectionScreenState extends State<ChooseYourTraveles> {
  String selectedOption = "Friends";
  String selectedImage = 'images/sail.jpg';

  void selectOption(String option, String imagePath) {
    setState(() {
      selectedOption = option;
      selectedImage = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Навигација назад
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Who's Traveling",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              // Динамички прикажување на дестинацијата
              "Choose your traveles",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20),
            TravelOption(
              icon: Image.asset('images/plane.jpg'),
              title: "Just Me",
              subtitle: "A solo traveler in exploration",
              isSelected: selectedOption == "Just Me",
              onTap: () => selectOption("Just Me", 'images/plane.jpg'),
            ),
            TravelOption(
              icon: Image.asset('images/wine.jpg'),
              title: "A Couple",
              subtitle: "Two travelers in tandem",
              isSelected: selectedOption == "A Couple",
              onTap: () => selectOption("A Couple", 'images/wine.jpg'),
            ),
            TravelOption(
              icon: Image.asset('images/house.jpg'),
              title: "Family",
              subtitle: "A group of fun-loving adventurers",
              isSelected: selectedOption == "Family",
              onTap: () => selectOption("Family", 'images/house.jpg'),
            ),
            TravelOption(
              icon: Image.asset('images/sail.jpg'),
              title: "Friends",
              subtitle: "A bunch of thrill-seekers",
              isSelected: selectedOption == "Friends",
              onTap: () => selectOption("Friends", 'images/sail.jpg'),
            ),
            SizedBox(height: 18),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calendar(destinationName: widget.destination.name,
                  travelType: selectedOption,
                  imagePath: selectedImage,
                    cityImage: widget.cityImage,)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 65),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
