import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:upeventadmin/screens/StudentActivity/SA_create_event_screen.dart';
import 'package:upeventadmin/screens/StudentActivity/SAupdate_event_screen.dart';
import 'package:upeventadmin/screens/eventview.dart';
import 'package:upeventadmin/screens/home_subscreen/ticket.dart';

class StudentActivity extends StatefulWidget {
  const StudentActivity({super.key});

  @override
  State<StudentActivity> createState() => _StudentActivityState();
}

final sadatabaseReference =
    FirebaseDatabase.instance.ref("StudentActivityEvent");

class _StudentActivityState extends State<StudentActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: FirebaseAnimatedList(
          defaultChild: const Center(
            child: CircularProgressIndicator(),
          ),
          query: sadatabaseReference,
          itemBuilder: (context, snapshot, index, animation) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventView(
                              eventName:
                                  snapshot.child("Event Name").value.toString(),
                              eventAddress: snapshot
                                  .child("Event Address")
                                  .value
                                  .toString(),
                              eventBannerURL: snapshot
                                  .child("Event ImageURL")
                                  .value
                                  .toString(),
                              eventDate:
                                  snapshot.child("Event Date").value.toString(),
                              eventDays:
                                  snapshot.child("Event Days").value.toString(),
                              eventDes: snapshot
                                  .child("Event Description")
                                  .value
                                  .toString(),
                              eventETime: snapshot
                                  .child("Event End Time")
                                  .value
                                  .toString(),
                              eventSTime: snapshot
                                  .child("Event Start Time")
                                  .value
                                  .toString(),
                            )));
              },
              title: Text(snapshot.child("Event Name").value.toString()),
              leading: Text(snapshot.child("Event Date").value.toString()),
              subtitle: Text(
                snapshot.child("Event Description").value.toString(),
                maxLines: 1,
              ),
              trailing: PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  PopupMenuItem(
                      child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SAUpdateEventScreen(
                                    id: snapshot.child("uid").value.toString(),
                                    eventAddress: snapshot
                                        .child("Event Address")
                                        .value
                                        .toString(),
                                    eventBannerURL: snapshot
                                        .child("Event ImageURL")
                                        .value
                                        .toString(),
                                    eventDate: snapshot
                                        .child("Event Date")
                                        .value
                                        .toString(),
                                    eventDays: snapshot
                                        .child("Event Days")
                                        .value
                                        .toString(),
                                    eventDes: snapshot
                                        .child("Event Description")
                                        .value
                                        .toString(),
                                    eventName: snapshot
                                        .child("Event Name")
                                        .value
                                        .toString(),
                                    eventSTime: snapshot
                                        .child("Event Start Time")
                                        .value
                                        .toString(),
                                    eventETime: snapshot
                                        .child("Event End Time")
                                        .value
                                        .toString(),
                                    eventPrice: snapshot
                                        .child("Event Ticket Price")
                                        .value
                                        .toString(),
                                  )));
                    },
                    leading: const Icon(Icons.edit),
                    title: const Text("Edit"),
                  )),
                  PopupMenuItem(
                      child: ListTile(
                    onTap: () {
                      ticketDatabaseReference
                          .child(snapshot.child("uid").value.toString())
                          .remove();
                      sadatabaseReference
                          .child(snapshot.child("uid").value.toString())
                          .remove();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(" Your Event deleted successfully")));
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    title: const Text("Delete"),
                  ))
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SACreateEventScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
