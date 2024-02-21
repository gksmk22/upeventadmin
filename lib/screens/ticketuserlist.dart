import 'package:flutter/material.dart';

class TicketUserList extends StatefulWidget {
  final String eventName;
  const TicketUserList({super.key, required this.eventName});

  @override
  State<TicketUserList> createState() => _TicketUserListState();
}

class _TicketUserListState extends State<TicketUserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ticket List of : ${widget.eventName}"),
      ),
    );
  }
}
