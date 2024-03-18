import 'package:flutter/material.dart';
import 'package:upeventadmin/screens/StudentActivity/SAupdate_markdown_description.dart';
import 'package:upeventadmin/screens/home_subscreen/sActivityevent.dart';
import 'package:upeventadmin/screens/home_subscreen/ticket.dart';



TextEditingController SAeventNameController = TextEditingController();
TextEditingController SAeventDateController = TextEditingController();
TextEditingController SAeventTimeStartController = TextEditingController();
TextEditingController SAeventTimeEndController = TextEditingController();
TextEditingController SAeventDaysController = TextEditingController();
TextEditingController SAeventAddressController = TextEditingController();
TextEditingController SAeventBannerURLController = TextEditingController();
TextEditingController SAeventDescriptionController = TextEditingController();
TextEditingController SAeventPriceController = TextEditingController();

class SAUpdateEventScreen extends StatelessWidget {
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
  const SAUpdateEventScreen(
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
    SAeventNameController.text = eventName;
    SAeventDateController.text = eventDate;
    SAeventTimeStartController.text = eventSTime;
    SAeventTimeEndController.text = eventETime;
    SAeventDaysController.text = eventDays;
    SAeventAddressController.text = eventAddress;
    SAeventDescriptionController.text = eventDes;
    SAeventBannerURLController.text = eventBannerURL;
    SAeventPriceController.text = eventPrice;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Event"),
        actions: [
          IconButton(
              onPressed: () {
                ticketDatabaseReference.child(id).update({
                  "Event Name": SAeventNameController.text.toString(),
                  "Event Ticket Price": SAeventPriceController.text.toString(),
                  "uid": id,
                });
                sadatabaseReference.child(id).update({
                  "Event Name": SAeventNameController.text.toString(),
                  "Event Start Time":
                      SAeventTimeStartController.text.toString(),
                  "Event End Time": SAeventTimeEndController.text.toString(),
                  "Event Date": SAeventDateController.text.toString(),
                  "Event Days": SAeventDaysController.text.toString(),
                  "Event Address": SAeventAddressController.text.toString(),
                  "Event ImageURL": SAeventBannerURLController.text.toString(),
                  "Event Description":
                      SAeventDescriptionController.text.toString(),
                  "Event Ticket Price": SAeventPriceController.text.toString(),
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
                SAeventDescriptionController.clear();
                SAeventPriceController.clear();
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
                controller: SAeventPriceController,
                decoration: const InputDecoration(
                    hintText: "Eg. 250.00", labelText: "Event Ticket Price"),
              ),
              TextField(
                enabled: false,
                controller: SAeventDescriptionController,
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
                                const SAUpdateMarkdownDescriptionScreen()));
                  },
                  child: const Text("Update Description"))
            ],
          ),
        ),
      ),
    );
  }
}
