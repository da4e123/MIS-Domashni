import 'package:ai_travel_planner/models/Destination.dart';


class DestinationSearchService{
  final Map<String, String> cityImages = {
    "Paris": "images/paris.jpg",
    "Los Angeles": "images/la.jpg",
    "Barcelona": "images/barcelona.jpg",
    "London": "images/london.jpeg",
    "Miami": "images/miami.jpeg",
  };

  final List<Destination> _destination = [
    Destination(name: "Paris", imagePath: "images/paris.jpg"),
    Destination(name: "Los Angeles", imagePath: "images/la.jpg"),
    Destination(name: "Barcelona", imagePath: "images/barcelona.jpg"),
    Destination(name: "London", imagePath: "images/london.jpeg"),
    Destination(name: "Miami", imagePath: "images/miami.jpeg"),
  ];

  List<Destination> search(String query){
    if(query.isEmpty){
      return _destination;
    }

    return _destination.where((destination) => destination.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}