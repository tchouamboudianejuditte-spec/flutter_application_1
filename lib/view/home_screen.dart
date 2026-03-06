import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class HomeScreen extends StatelessWidget {
  final List<Event> events = [
    Event(
      name: "Music Festival",
      date: "April 15, 2026",
      location: "California",
      description: "A large music festival featuring global artists.",
      image: "assets/images/music festival.png",
    ),
    Event(
      name: "Film Festival",
      date: "May 20, 2026",
      location: "France",
      description: "International film celebration event.",
      image: "assets/images/film festival.png",
    ),
    Event(
      name: "Gaming Expo",
      date: "August 10, 2026",
      location: "Germany",
      description: "World's biggest gaming exhibition.",
      image: "assets/images/gaming expo.png",
    ),
    Event(
      name: "Football Final",
      date: "June 2026",
      location: "USA",
      description: "International football competition.",
      image: "assets/images/football final.png",
    ),
    Event(
      name: "Art Exhibition",
      date: "September 2026",
      location: "Italy",
      description: "Major contemporary art exhibition.",
      image: "assets/images/art exhibition.png",
    ),
  ];

   HomeScreen({super.key});
   
     @override
     Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
     
      }
     }