import 'package:flutter/material.dart';
import 'package:upeventadmin/screens/home_subscreen/event.dart';
import 'package:upeventadmin/screens/home_subscreen/ticket.dart';

import 'package:upeventadmin/screens/update_markdown_description.dart';

TextEditingController eventNameController = TextEditingController();
TextEditingController eventDateController = TextEditingController();
TextEditingController eventTimeStartController = TextEditingController();
TextEditingController eventTimeEndController = TextEditingController();
TextEditingController eventDaysController = TextEditingController();
TextEditingController eventAddressController = TextEditingController();
TextEditingController eventBannerURLController = TextEditingController();
TextEditingController eventDescriptionController = TextEditingController();
TextEditingController eventPriceController = TextEditingController();

class UpdateEventScreen extends StatelessWidget {
  final String id;
  final String eventName;
  final String eventDes;
  final String eventBannerURL;
  final String eventDate;
  final String eventSTime;
  final String eventETime;
  final String eventAddress;
  final String eventDays;
  final String eventPrice;
  const UpdateEventScreen(
      {super.key,
      required this.id,
      required this.eventName,
      required this.eventDes,
      required this.eventBannerURL,
      required this.eventDate,
      required this.eventSTime,
      required this.eventETime,
      required this.eventAddress,
      required this.eventDays,
      required this.eventPrice});

  @override
  Widget build(BuildContext context) {
    eventNameController.text = eventName;
    eventDateController.text = eventDate;
    eventTimeStartController.text = eventSTime;
    eventTimeEndController.text = eventETime;
    eventDaysController.text = eventDays;
    eventAddressController.text = eventAddress;
    eventDescriptionController.text = eventDes;
    eventBannerURLController.text = eventBannerURL;
    eventPriceController.text = eventPrice;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Event"),
        actions: [
          IconButton(
              onPressed: () {
                ticketDatabaseReference.child(id).update({
                  "Event Name": eventNameController.text.toString(),
                  "Event Ticket Price": eventPriceController.text.toString(),
                  "uid": id,
                });
                databaseReference.child(id).update({
                  "Event Name": eventNameController.text.toString(),
                  "Event Start Time": eventTimeStartController.text.toString(),
                  "Event End Time": eventTimeEndController.text.toString(),
                  "Event Date": eventDateController.text.toString(),
                  "Event Days": eventDaysController.text.toString(),
                  "Event Address": eventAddressController.text.toString(),
                  "Event ImageURL": eventBannerURLController.text.toString(),
                  "Event Description":
                      eventDescriptionController.text.toString(),
                  "Event Ticket Price": eventPriceController.text.toString(),
                  "uid": id //this is unique id for each event.
                });
                // clearing TextController after add event to the sever.
                eventNameController.clear();
                eventTimeStartController.clear();
                eventTimeEndController.clear();
                eventDateController.clear();
                eventDaysController.clear();
                eventAddressController.clear();
                eventBannerURLController.clear();
                eventDescriptionController.clear();
                eventPriceController.clear();
                // going back to main screen.
                Navigator.pop(context);
                //msg for user for update.
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(" Your Event updated successfully")));
              },
              icon: const Icon(Icons.update))
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
                controller: eventNameController,
                decoration: const InputDecoration(
                    hintText: "Eg. Techno Festival", labelText: "Event Name"),
              ),
              TextField(
                controller: eventTimeStartController,
                decoration: const InputDecoration(
                    hintText: "Eg. 6:45 PM", labelText: "Event Start Time"),
              ),
              TextField(
                controller: eventTimeEndController,
                decoration: const InputDecoration(
                    hintText: "Eg. 10:45 PM", labelText: "Event End Time"),
              ),
              TextField(
                controller: eventDateController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                    hintText: "Eg. 27/04/2024", labelText: "Event Date"),
              ),
              TextField(
                controller: eventDaysController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Eg. 2 days duration", labelText: "Event Days"),
              ),
              TextField(
                controller: eventAddressController,
                decoration: const InputDecoration(
                    hintText: "Eg. TMA PAI", labelText: "Event Address"),
              ),
              TextField(
                controller: eventBannerURLController,
                decoration: const InputDecoration(
                    hintText: "Eg. url of the event banner image",
                    labelText: "Event Banner URL"),
              ),
              TextField(
                controller: eventPriceController,
                decoration: const InputDecoration(
                    hintText: "Eg. 250.00", labelText: "Event Ticket Price"),
              ),
              TextField(
                enabled: false,
                controller: eventDescriptionController,
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
                                const UpdateMarkdownDescriptionScreen()));
                  },
                  child: const Text("Update Description"))
            ],
          ),
        ),
      ),
    );
  }
}
