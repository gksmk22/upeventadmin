import 'package:flutter/material.dart';
import 'package:upeventadmin/screens/StudentClub/SCcreate_markdown_description.dart';
import 'package:upeventadmin/screens/home_subscreen/sClubevent.dart';
import 'package:upeventadmin/screens/home_subscreen/ticket.dart';
import 'package:upeventadmin/screens/update_event_screen.dart';

TextEditingController SCeventNameController = TextEditingController();
TextEditingController SCeventDateController = TextEditingController();
TextEditingController SCeventTimeStartController = TextEditingController();
TextEditingController SCeventTimeEndController = TextEditingController();
TextEditingController SCeventDaysController = TextEditingController();
TextEditingController SCeventAddressController = TextEditingController();
TextEditingController SCeventBannerURLController = TextEditingController();
TextEditingController SCcreateeventDescriptionController =
    TextEditingController();
TextEditingController SCcreateeventPriceController = TextEditingController();

class SCCreateEventScreen extends StatelessWidget {
  const SCCreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Event"),
        actions: [
          IconButton(
              onPressed: () {
                final id = DateTime.now().microsecond.toString();
                ticketDatabaseReference.child(id).set({
                  "Event Name": SCeventNameController.text.toString(),
                  "Event Ticket Price":
                      SCcreateeventPriceController.text.toString(),
                  "uid": id,
                  "User Ticket List": {}
                });
                scdatabaseReference.child(id).set({
                  "Event Name": SCeventNameController.text.toString(),
                  "Event Start Time":
                      SCeventTimeStartController.text.toString(),
                  "Event End Time": SCeventTimeEndController.text.toString(),
                  "Event Date": SCeventDateController.text.toString(),
                  "Event Days": SCeventDaysController.text.toString(),
                  "Event Address": eventAddressController.text.toString(),
                  "Event ImageURL": eventBannerURLController.text.toString(),
                  "Event Description":
                      SCcreateeventDescriptionController.text.toString(),
                  "Event Ticket Price":
                      SCcreateeventPriceController.text.toString(),
                  "uid": id //this is unique id for each event.
                });
                // clearing TextController after add event to the sever.
                eventNameController.clear();
                eventTimeStartController.clear();
                eventTimeEndController.clear();
                eventDateController.clear();
                eventDaysController.clear();
                SCeventAddressController.clear();
                SCeventBannerURLController.clear();
                SCcreateeventDescriptionController.clear();
                SCcreateeventPriceController.clear();
                // going back to main screen.
                Navigator.pop(context);
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: SCeventNameController,
                decoration: const InputDecoration(
                    hintText: "Eg. Techno Festival", labelText: "Event Name"),
              ),
              TextField(
                controller: SCeventTimeStartController,
                decoration: const InputDecoration(
                    hintText: "Eg. 6:45 PM", labelText: "Event Start Time"),
              ),
              TextField(
                controller: SCeventTimeEndController,
                decoration: const InputDecoration(
                    hintText: "Eg. 10:45 PM", labelText: "Event End Time"),
              ),
              TextField(
                controller: SCeventDateController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                    hintText: "Eg. 27/04/2024", labelText: "Event Date"),
              ),
              TextField(
                controller: SCeventDaysController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Eg. 2 days duration", labelText: "Event Days"),
              ),
              TextField(
                controller: SCeventAddressController,
                decoration: const InputDecoration(
                    hintText: "Eg. TMA PAI", labelText: "Event Address"),
              ),
              TextField(
                controller: SCeventBannerURLController,
                decoration: const InputDecoration(
                    hintText: "Eg. url of the event banner image",
                    labelText: "Event Banner URL"),
              ),
              TextField(
                controller: SCcreateeventPriceController,
                decoration: const InputDecoration(
                    hintText: "Eg. 250.00", labelText: "Event Ticket Price"),
              ),
              TextField(
                enabled: false,
                controller: SCcreateeventDescriptionController,
                decoration: const InputDecoration(
                    hintText: "Eg. Description of event",
                    labelText: "Event Description"),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SCCreateMarkdownDescriptionScreen()));
                  },
                  child: const Text("Add Description"))
            ],
          ),
        ),
      ),
    );
  }
}
