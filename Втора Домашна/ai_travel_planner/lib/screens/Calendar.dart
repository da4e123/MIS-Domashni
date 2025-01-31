import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ai_travel_planner/screens/Budget.dart';

class Calendar extends StatefulWidget {
  final String destinationName;
  final String travelType;
  final String imagePath;
  final String cityImage;

  Calendar({
    required this.destinationName,
    required this.travelType,
    required this.imagePath,
    required this.cityImage,
  });

  @override
  _TravelDateScreenState createState() => _TravelDateScreenState();
}

class _TravelDateScreenState extends State<Calendar> {
  Set<DateTime> selectedDates = {}; // Store multiple selected dates

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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Travel Dates",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: selectedDates.isNotEmpty ? selectedDates.first : DateTime.now(),
              selectedDayPredicate: (day) {
                return selectedDates.contains(day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  if (selectedDates.contains(selectedDay)) {
                    selectedDates.remove(selectedDay); // Unselect date if already selected
                  } else {
                    selectedDates.add(selectedDay); // Select new date
                  }
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.black12,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: selectedDates.isNotEmpty
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Budget(
                      destinationName: widget.destinationName,
                      travelType: widget.travelType,
                      selectedDates: selectedDates.toList(),
                      totalDays: selectedDates.length, // Pass number of days
                      imagePath: widget.imagePath,
                      cityImage: widget.cityImage,
                    ),
                  ),
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
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
