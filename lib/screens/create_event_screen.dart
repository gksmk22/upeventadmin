import 'package:flutter/material.dart';
import 'package:upeventadmin/screens/create_markdown_description.dart';
import 'package:upeventadmin/screens/homescreen.dart';

TextEditingController eventNameController = TextEditingController();
TextEditingController eventDateController = TextEditingController();
TextEditingController eventTimeStartController = TextEditingController();
TextEditingController eventTimeEndController = TextEditingController();
TextEditingController eventDaysController = TextEditingController();
TextEditingController eventAddressController = TextEditingController();
TextEditingController eventBannerURLController = TextEditingController();
TextEditingController createeventDescriptionController = TextEditingController();

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Event"),
        actions: [
          IconButton(
              onPressed: () {
                final id = DateTime.now().microsecond.toString();
                databaseReference.child(id).set({
                  "Event Name": eventNameController.text.toString(),
                  "Event Start Time": eventTimeStartController.text.toString(),
                  "Event End Time": eventTimeEndController.text.toString(),
                  "Event Date": eventDateController.text.toString(),
                  "Event Days": eventDaysController.text.toString(),
                  "Event Address": eventAddressController.text.toString(),
                  "Event ImageURL": eventBannerURLController.text.toString(),
                  "Event Description":
                      createeventDescriptionController.text.toString(),
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
                createeventDescriptionController.clear();
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
                enabled: false,
                controller: createeventDescriptionController,
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
                                const CreateMarkdownDescriptionScreen()));
                  },
                  child: const Text("Add Description"))
            ],
          ),
        ),
      ),
    );
  }
}
