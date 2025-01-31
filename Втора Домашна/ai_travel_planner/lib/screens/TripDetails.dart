import 'package:flutter/material.dart';

class TripDetails extends StatelessWidget {
  final String destinationName;

  final String travelType;
  final String cityImage;
  final String imagePath;
  final String travelDates;


  const TripDetails({
    required this.destinationName,

    required this.travelType,
    required this.cityImage,
    required this.imagePath,
    required this.travelDates
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trip Image
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    cityImage,
                    height: 400,
                    width: 400,
                    fit: BoxFit.cover,
                  )
              ),
              SizedBox(height: 16),
              // Trip Info
              Text(
                destinationName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 8),
              Text(
                // '05 Jul 2024 - 06 Jul 2024',
                travelDates as String,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Image.asset('images/friends.jpg'),
                  SizedBox(width: 4),
                  Text(travelType),
                ],
              ),
              SizedBox(height: 16),
              // Flights Section
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('images/plane.jpg'),
                              SizedBox(width: 8),
                              Text(
                                'Flights',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Airline: Delta',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Price: \$200-\$400 (approx.)',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Book Here', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Hotel Recommendations
              // Text(

              //   ),
              // ),
              Row(
                children: [
                  Image.asset("images/hotel_recomendation.jpg"),
                  Text('Hotel Recommendation',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(width: 8),

                ],
              ),
              SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                child: Row(
                  children: [
                    // Hotel 1
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                            child: Image.asset(
                              'images/hotel_1.jpg',
                              height: 120,
                              width: 200, // Set a fixed width to prevent overflow
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'The Venetian Resort Las Vegas',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow, size: 16),
                                    Text('4.5'),
                                    SizedBox(width: 8),
                                    Image.asset("images/moderate.jpg"),
                                    Text('\$150-\$250/night'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    // Hotel 2
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                            child: Image.asset(
                              'images/hotel_2.jpg',
                              height: 120,
                              width: 200, // Set a fixed width to prevent overflow
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'The LINQ Hotel + Experience',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow, size: 16),
                                    Text('4.0'),
                                    SizedBox(width: 8),
                                    Image.asset("images/moderate.jpg"),
                                    Text('\$100-\$200/night'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Plan Details
              Text(
                'Plan Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              // Example Day Plan (You can add more here)
            ],
          ),
        ),
      ),
    );
  }
}
