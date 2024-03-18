import 'package:flutter/material.dart';
import 'package:upeventadmin/screens/StudentActivity/SAcreate_markdown_description.dart';

import 'package:upeventadmin/screens/home_subscreen/sActivityevent.dart';
import 'package:upeventadmin/screens/home_subscreen/ticket.dart';
import 'package:upeventadmin/screens/update_event_screen.dart';

TextEditingController SAeventNameController = TextEditingController();
TextEditingController SAeventDateController = TextEditingController();
TextEditingController SAeventTimeStartController = TextEditingController();
TextEditingController SAeventTimeEndController = TextEditingController();
TextEditingController SAeventDaysController = TextEditingController();
TextEditingController SAeventAddressController = TextEditingController();
TextEditingController SAeventBannerURLController = TextEditingController();
TextEditingController SAcreateeventDescriptionController =
    TextEditingController();
TextEditingController SAcreateeventPriceController = TextEditingController();

class SACreateEventScreen extends StatelessWidget {
  const SACreateEventScreen({super.key});

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
                  "Event Name": eventNameController.text.toString(),
                  "Event Ticket Price": eventPriceController.text.toString(),
                  "uid": id,
                  "User Ticket List": {}
                });
                sadatabaseReference.child(id).set({
                  "Event Name": SAeventNameController.text.toString(),
                  "Event Start Time":
                      SAeventTimeStartController.text.toString(),
                  "Event End Time": SAeventTimeEndController.text.toString(),
                  "Event Date": SAeventDateController.text.toString(),
                  "Event Days": SAeventDaysController.text.toString(),
                  "Event Address": SAeventAddressController.text.toString(),
                  "Event ImageURL": SAeventBannerURLController.text.toString(),
                  "Event Description":
                      SAcreateeventDescriptionController.text.toString(),
                  "Event Ticket Price":
                      SAcreateeventPriceController.text.toString(),
                  "uid": id //this is unique id for each event.
                });
                // clearing TextController after add event to the sever.
                SAeventNameController.clear();
                SAeventTimeStartController.clear();
                SAeventTimeEndController.clear();
                SAeventDateController.clear();
                SAeventDaysController.clear();
                SAeventAddressController.clear();
                SAeventBannerURLController.clear();
                SAcreateeventDescriptionController.clear();
                SAcreateeventPriceController.clear();
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
                controller: SAeventNameController,
                decoration: const InputDecoration(
                    hintText: "Eg. Techno Festival", labelText: "Event Name"),
              ),
              TextField(
                controller: SAeventTimeStartController,
                decoration: const InputDecoration(
                    hintText: "Eg. 6:45 PM", labelText: "Event Start Time"),
              ),
              TextField(
                controller: SAeventTimeEndController,
                decoration: const InputDecoration(
                    hintText: "Eg. 10:45 PM", labelText: "Event End Time"),
              ),
              TextField(
                controller: SAeventDateController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                    hintText: "Eg. 27/04/2024", labelText: "Event Date"),
              ),
              TextField(
                controller: SAeventDaysController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Eg. 2 days duration", labelText: "Event Days"),
              ),
              TextField(
                controller: SAeventAddressController,
                decoration: const InputDecoration(
                    hintText: "Eg. TMA PAI", labelText: "Event Address"),
              ),
              TextField(
                controller: SAeventBannerURLController,
                decoration: const InputDecoration(
                    hintText: "Eg. url of the event banner image",
                    labelText: "Event Banner URL"),
              ),
              TextField(
                controller: SAcreateeventPriceController,
                decoration: const InputDecoration(
                    hintText: "Eg. 250.00", labelText: "Event Ticket Price"),
              ),
              TextField(
                enabled: false,
                controller: SAcreateeventDescriptionController,
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
                                const SACreateMarkdownDescriptionScreen()));
                  },
                  child: const Text("Add Description"))
            ],
          ),
        ),
      ),
    );
  }
}
