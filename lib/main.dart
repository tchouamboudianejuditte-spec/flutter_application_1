import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

// ===================== MAIN SCREEN WITH BOTTOM NAV =====================

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// ===================== EVENT MODEL =====================

class Event {
  final String name;
  final String date;
  final String location;
  final String description;
  final String image;

  Event({
    required this.name,
    required this.date,
    required this.location,
    required this.description,
    required this.image,
  });
}

// ===================== HOME SCREEN =====================

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
    return Scaffold(
      appBar: AppBar(title: Text("Events")),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];

          return Card(
            margin: EdgeInsets.only(bottom: 12),
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(event.image),
                  SizedBox(height: 8),
                  Text(
                    event.name,
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(event.date),
                  SizedBox(height: 4),
                  Text(event.description),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      child: Text("View Details"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                DetailsScreen(event: event),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ===================== DETAILS SCREEN =====================

class DetailsScreen extends StatelessWidget {
  final Event event;

  const DetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Image.asset(event.image),
            SizedBox(height: 10),
            Text(
              event.name,
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(event.description),
            SizedBox(height: 10),
            Text("Date: ${event.date}"),
            Text("Location: ${event.location}"),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Book Now"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        BookingScreen(event: event),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

// ===================== BOOKING SCREEN =====================

class BookingScreen extends StatefulWidget {
  final Event event;

  const BookingScreen({super.key, required this.event});

  @override
  // ignore: library_private_types_in_public_api
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Book ${widget.event.name}")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration:
                    InputDecoration(labelText: "Full Name"),
                validator: (value) =>
                    value!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: "Email"),
                validator: (value) =>
                    value!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: "Phone"),
                validator: (value) =>
                    value!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Number of Tickets"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Required" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Submit"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("Success"),
                        content:
                            Text("Booking Confirmed!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.popUntil(
                                  context,
                                  (route) =>
                                      route.isFirst);
                            },
                            child: Text("OK"),
                          )
                        ],
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ===================== PROFILE SCREEN =====================

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  "assets/images/network image.png"),
            ),
            SizedBox(height: 10),
            Text(
              "Diane Tchouambou",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text("diane@email.com"),
            SizedBox(height: 10),
            Text(
              "Software Engineering student passionate about mobile app development.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}