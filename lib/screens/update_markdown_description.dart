import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:simple_markdown_editor/widgets/markdown_form_field.dart';
import 'package:upeventadmin/screens/update_event_screen.dart';

class UpdateMarkdownDescriptionScreen extends StatefulWidget {
  const UpdateMarkdownDescriptionScreen({super.key});

  @override
  State<UpdateMarkdownDescriptionScreen> createState() =>
      _UpdateMarkdownDescriptionScreenState();
}

class _UpdateMarkdownDescriptionScreenState
    extends State<UpdateMarkdownDescriptionScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text("Update Description MarkDown"),
            Text(
              "Powered by : REGO Labs",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ],
        ),
        bottom: TabBar(controller: tabController, tabs: const [
          Tab(
            text: "Preview",
            icon: Icon(Icons.preview_outlined),
          ),
          Tab(
            text: "Edit",
            icon: Icon(Icons.edit),
          )
        ]),
      ),
      body: TabBarView(controller: tabController, children: [
        Markdown(
          data: eventDescriptionController.text,
        ),
        MarkdownFormField(
          onChanged: (value) => setState(() {
            eventDescriptionController.text = value;
          }),
          focusNode: _focusNode,
          autoCloseAfterSelectEmoji: false,
          controller: eventDescriptionController,
          enableToolBar: true,
          emojiConvert: true,
        )
      ]),
    );
  }
}
