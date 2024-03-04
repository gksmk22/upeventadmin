import 'package:flutter/material.dart';
import 'package:upeventadmin/screens/home_subscreen/event.dart';
import 'package:upeventadmin/screens/home_subscreen/sActivityevent.dart';
import 'package:upeventadmin/screens/home_subscreen/sClubevent.dart';
import 'package:upeventadmin/screens/home_subscreen/ticket.dart';
import 'package:upeventadmin/screens/loginscreen.dart';

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => const Dialog(
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Center(
                          child: Text(
                            "Send a mail on this : area22gml@gmail.com",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ));
          },
          icon: const Icon(Icons.help),
        ),
        title: Column(
          children: [
            const Text("UP Event Admin Panel - Event"),
            Text(
              "UID : ${auth.currentUser!.uid}",
              style: const TextStyle(fontWeight: FontWeight.w100, fontSize: 10),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: <Widget>[
        const EventScreen(),
        const StudentClubEvent(),
        const StudentActivity(),
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
            label: 'Major Events',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.hub),
            icon: Icon(Icons.hub_outlined),
            label: 'SC Events',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.sports_outlined),
            icon: Icon(Icons.sports_outlined),
            label: 'SA Events',
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
