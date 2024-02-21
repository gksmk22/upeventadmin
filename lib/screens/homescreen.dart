import 'package:flutter/material.dart';
import 'package:upeventadmin/screens/home_subscreen/event.dart';
import 'package:upeventadmin/screens/home_subscreen/ticket.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const EventScreen(),
        const TicketScreen(),
      ][selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 70,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.event),
            icon: Icon(Icons.event_outlined),
            label: 'Events',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.airplane_ticket),
            icon: Icon(Icons.airplane_ticket_outlined),
            label: 'Tickets',
          ),
        ],
      ),
    );
  }
}
