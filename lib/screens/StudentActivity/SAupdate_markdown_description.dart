import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:simple_markdown_editor/widgets/markdown_form_field.dart';
import 'package:upeventadmin/screens/StudentActivity/SAupdate_event_screen.dart';

class SAUpdateMarkdownDescriptionScreen extends StatefulWidget {
  const SAUpdateMarkdownDescriptionScreen({super.key});

  @override
  State<SAUpdateMarkdownDescriptionScreen> createState() =>
      _SAUpdateMarkdownDescriptionScreenState();
}

class _SAUpdateMarkdownDescriptionScreenState
    extends State<SAUpdateMarkdownDescriptionScreen>
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
          data: SAeventDescriptionController.text,
        ),
        MarkdownFormField(
          onChanged: (value) => setState(() {
            SAeventDescriptionController.text = value;
          }),
          focusNode: _focusNode,
          autoCloseAfterSelectEmoji: false,
          controller: SAeventDescriptionController,
          enableToolBar: true,
          emojiConvert: true,
        )
      ]),
    );
  }
}
