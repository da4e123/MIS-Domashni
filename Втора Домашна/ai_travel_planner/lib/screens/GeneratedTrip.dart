import 'package:ai_travel_planner/screens/TripDetails.dart';
import 'package:flutter/material.dart';

class GeneratedTrip extends StatelessWidget {
  final String destinationName;
  final String travelType;
  final String imagePath;
  final String cityImage;
  final String travelDates;
  final int totalDays;


  GeneratedTrip({
    required this.destinationName,
    required this.travelType,
    required this.imagePath,
    required this.cityImage,
    required this.travelDates,
    required this.totalDays
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Trips',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                onPressed: () {
                  // Логика за додавање нова дестинација може да се имплементира тука
                },
                icon: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Large Trip Card со ажурирани податоци
              Container(
                width: 363, // Ширина на картата
                height: 343,
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 180, // Висина на сликата
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                          image: DecorationImage(
                            image: AssetImage(cityImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          destinationName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(travelDates as String),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('images/friends.jpg'),
                            SizedBox(width: 4),
                            Text(travelType),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: 363,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 15),
                              side: BorderSide(
                                  color: Colors.black, width: 2), // Граница
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TripDetails(destinationName: destinationName,
                                    travelDates: travelDates,
                                    travelType: travelType,
                                    cityImage: cityImage,
                                    imagePath: imagePath)),
                              );
                            },
                            child: Text(
                              'See your plan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Small Trip Card со ажурирани податоци
              Container(
                width: 363,
                height: 120,
                child: Card(
                  elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(16)),
                          image: DecorationImage(
                            image: AssetImage(cityImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            destinationName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(travelDates as String),
                              SizedBox(height: 4),
                              Text('Traveling: $travelType'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'My Trip',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
