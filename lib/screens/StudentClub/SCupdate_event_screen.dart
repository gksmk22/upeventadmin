import 'package:flutter/material.dart';
import 'package:upeventadmin/screens/StudentClub/SCupdate_markdown_description.dart';
import 'package:upeventadmin/screens/home_subscreen/sClubevent.dart';
import 'package:upeventadmin/screens/home_subscreen/ticket.dart';

TextEditingController SCeventNameController = TextEditingController();
TextEditingController SCeventDateController = TextEditingController();
TextEditingController SCeventTimeStartController = TextEditingController();
TextEditingController SCeventTimeEndController = TextEditingController();
TextEditingController SCeventDaysController = TextEditingController();
TextEditingController SCeventAddressController = TextEditingController();
TextEditingController SCeventBannerURLController = TextEditingController();
TextEditingController SCeventDescriptionController = TextEditingController();
TextEditingController SCeventPriceController = TextEditingController();

class SCUpdateEventScreen extends StatelessWidget {
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
  const SCUpdateEventScreen(
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
    SCeventNameController.text = eventName;
    SCeventDateController.text = eventDate;
    SCeventTimeStartController.text = eventSTime;
    SCeventTimeEndController.text = eventETime;
    SCeventDaysController.text = eventDays;
    SCeventAddressController.text = eventAddress;
    SCeventDescriptionController.text = eventDes;
    SCeventBannerURLController.text = eventBannerURL;
    SCeventPriceController.text = eventPrice;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Event"),
        actions: [
          IconButton(
              onPressed: () {
                ticketDatabaseReference.child(id).update({
                  "Event Name": SCeventNameController.text.toString(),
                  "Event Ticket Price": SCeventPriceController.text.toString(),
                  "uid": id,
                });
                scdatabaseReference.child(id).update({
                  "Event Name": SCeventNameController.text.toString(),
                  "Event Start Time":
                      SCeventTimeStartController.text.toString(),
                  "Event End Time": SCeventTimeEndController.text.toString(),
                  "Event Date": SCeventDateController.text.toString(),
                  "Event Days": SCeventDaysController.text.toString(),
                  "Event Address": SCeventAddressController.text.toString(),
                  "Event ImageURL": SCeventBannerURLController.text.toString(),
                  "Event Description":
                      SCeventDescriptionController.text.toString(),
                  "Event Ticket Price": SCeventPriceController.text.toString(),
                  "uid": id //this is unique id for each event.
                });
                // clearing TextController after add event to the sever.
                SCeventNameController.clear();
                SCeventTimeStartController.clear();
                SCeventTimeEndController.clear();
                SCeventDateController.clear();
                SCeventDaysController.clear();
                SCeventAddressController.clear();
                SCeventBannerURLController.clear();
                SCeventDescriptionController.clear();
                SCeventPriceController.clear();
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
                controller: SCeventPriceController,
                decoration: const InputDecoration(
                    hintText: "Eg. 250.00", labelText: "Event Ticket Price"),
              ),
              TextField(
                enabled: false,
                controller: SCeventDescriptionController,
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
                                const SCUpdateMarkdownDescriptionScreen()));
                  },
                  child: const Text("Update Description"))
            ],
          ),
        ),
      ),
    );
  }
}
