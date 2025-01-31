import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ai_travel_planner/screens/ReviewYourTrip.dart';
import 'package:ai_travel_planner/models/BudgetOption.dart';

class Budget extends StatefulWidget {
  final String destinationName;
  final String travelType;
  final String imagePath;
  final String cityImage;
  final List<DateTime> selectedDates;
  final int totalDays;

  Budget({
    required this.destinationName,
    required this.travelType,
    required this.imagePath,
    required this.cityImage,
    required this.selectedDates,
    required this.totalDays,
  });

  @override
  _BudgetSelectionScreenState createState() => _BudgetSelectionScreenState();
}

class _BudgetSelectionScreenState extends State<Budget> {
  String selectedOption = "Cheap"; // Default budget option
  String iconOption = 'images/cheap.jpg'; // Default budget icon

  void selectOption(String option, String selectedIcon) {
    setState(() {
      selectedOption = option;
      iconOption = selectedIcon;
    });
  }

  String getFormattedDateRange(List<DateTime> dates) {
    if (dates.isEmpty) {
      return ''; // Return empty if no dates selected
    }

    // Get first and last date from the selected dates
    DateTime firstDate = dates.first;
    DateTime lastDate = dates.last;

    // Format the dates using DateFormat
    String formattedFirstDate = DateFormat('dd MMM yyyy').format(firstDate);
    String formattedLastDate = DateFormat('dd MMM yyyy').format(lastDate);
    int totalDays = lastDate.difference(firstDate).inDays;

    // Return the date range in the format "dd MMM yyyy - dd MMM yyyy"
    return '$formattedFirstDate To $formattedLastDate ($totalDays days)';
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
              "Budget",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Choose spending habits for your trip",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            BudgetOption(
              icon: Image.asset('images/cheap.jpg'),
              title: "Cheap",
              subtitle: "Stay conscious of costs",
              isSelected: selectedOption == "Cheap",
              onTap: () => selectOption("Cheap", 'images/cheap.jpg'),
            ),
            BudgetOption(
              icon: Image.asset('images/moderate.jpg'),
              title: "Moderate",
              subtitle: "Keep cost on the average side",
              isSelected: selectedOption == "Moderate",
              onTap: () => selectOption("Moderate", 'images/moderate.jpg'),
            ),
            BudgetOption(
              icon: Image.asset('images/luxury.jpg'),
              title: "Luxury",
              subtitle: "Don't worry about cost",
              isSelected: selectedOption == "Luxury",
              onTap: () => selectOption("Luxury", 'images/luxury.jpg'),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: widget.selectedDates.isEmpty
                  ? null // Disable button if no dates are selected
                  : () {
                // Get the formatted date range
                String travelDates = getFormattedDateRange(widget.selectedDates);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewYourTrip(
                      destinationName: widget.destinationName,
                      travelDates: travelDates, // Send as a formatted string
                      travelType: widget.travelType,
                      budget: selectedOption,
                      imagePath: widget.imagePath,
                      iconOption: iconOption,
                      cityImage: widget.cityImage,
                      totalDays: widget.totalDays, // Pass total travel days
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                widget.selectedDates.isEmpty ? Colors.grey : Colors.black,
                minimumSize: Size(double.infinity, 60),
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
