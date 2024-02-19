import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class EventView extends StatelessWidget {
  final String eventName;

  final String eventDes;

  final String eventSTime;

  final String eventETime;

  final String eventBannerURL;

  final String eventDate;

  final String eventAddress;

  final String eventDays;

  const EventView({
    super.key,
    required this.eventName,
    required this.eventDes,
    required this.eventSTime,
    required this.eventETime,
    required this.eventBannerURL,
    required this.eventDate,
    required this.eventAddress,
    required this.eventDays,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(eventName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(eventBannerURL),
              const SizedBox(
                height: 12,
              ),
              MarkdownBody(data: eventDes),
              const SizedBox(
                height: 20,
              ),
              Text("Event Address: $eventAddress"),
              Text("Event Date: $eventDate"),
              Text("Event Days Duration: $eventDays"),
              Text("Event Start Time: $eventSTime"),
              Text("Event End Time: $eventETime"),
            ],
          ),
        ),
      ),
    );
  }
}
