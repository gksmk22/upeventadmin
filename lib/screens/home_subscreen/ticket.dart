import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:upeventadmin/screens/ticketuserlist.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

final ticketDatabaseReference = FirebaseDatabase.instance.ref("TicketData");

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirebaseAnimatedList(
          defaultChild: const Center(
            child: CircularProgressIndicator(),
          ),
          query: ticketDatabaseReference,
          itemBuilder: (context, snapshot, index, animation) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TicketUserList(
                            eventName: snapshot
                                .child("Event Name")
                                .value
                                .toString())));
              },
              leading: const Icon(Icons.airplane_ticket),
              title: Text(snapshot.child("Event Name").value.toString()),
              subtitle: Text(
                  "Price : ${snapshot.child("Event Ticket Price").value.toString()}"),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }
}
