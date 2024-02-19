import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:upeventadmin/screens/create_event_screen.dart';
import 'package:upeventadmin/screens/eventview.dart';
import 'package:upeventadmin/screens/loginscreen.dart';
import 'package:upeventadmin/screens/update_event_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final databaseReference = FirebaseDatabase.instance.ref("EventsData");

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            const Text("UP Event Admin Panel"),
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
      body: FirebaseAnimatedList(
          defaultChild: const Center(
            child: CircularProgressIndicator(),
          ),
          query: databaseReference,
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
                              builder: (context) => UpdateEventScreen(
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
                                  )));
                    },
                    leading: const Icon(Icons.edit),
                    title: const Text("Edit"),
                  )),
                  PopupMenuItem(
                      child: ListTile(
                    onTap: () {
                      databaseReference
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
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CreateEventScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
