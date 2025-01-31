import 'package:flutter/material.dart';
import 'package:ai_travel_planner/models/Destination.dart';
import 'package:ai_travel_planner/service/DestinationSearchService.dart';
import 'package:ai_travel_planner/screens/ChooseYourTraveles.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final DestinationSearchService _searchService = DestinationSearchService();
  List<Destination> _searchResults = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  
  Destination? _selectedDestination;

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isNotEmpty) {
        _isSearching = true;
        _searchResults = _searchService.search(query);
      } else {
        _isSearching = false;
        _searchResults = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Search',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Поле за пребарување
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search for a city...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16),
            if (_isSearching)
              Expanded(
                child: _searchResults.isEmpty
                    ? Center(
                  child: Text(
                    'No results found',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
                    : ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final city = _searchResults[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDestination = city; // Зачувување на избраната дестинација
                        });

                        String cityImage = DestinationSearchService().cityImages[city.name] ?? "images/paris.jpg";
                        // Навигација кон ChooseYourTraveles екран со избраната дестинација
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChooseYourTraveles(
                              destination: _selectedDestination!,
                              cityImage: cityImage
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          city.name,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  },
                ),
              ),
            // Текст "powered by Google"
            if (!_isSearching)
              Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(text: 'powered by '),
                      TextSpan(
                        text: 'G',
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(
                        text: 'o',
                        style: TextStyle(color: Colors.red),
                      ),
                      TextSpan(
                        text: 'o',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      TextSpan(
                        text: 'g',
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(
                        text: 'l',
                        style: TextStyle(color: Colors.green),
                      ),
                      TextSpan(
                        text: 'e',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
