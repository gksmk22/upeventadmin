import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:simple_markdown_editor/widgets/markdown_form_field.dart';
import 'package:upeventadmin/screens/create_event_screen.dart';

class SACreateMarkdownDescriptionScreen extends StatefulWidget {
  const SACreateMarkdownDescriptionScreen({super.key});

  @override
  State<SACreateMarkdownDescriptionScreen> createState() =>
      _SACreateMarkdownDescriptionScreenState();
}

class _SACreateMarkdownDescriptionScreenState
    extends State<SACreateMarkdownDescriptionScreen>
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
            Text("Add Description MarkDown"),
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
          data: createeventDescriptionController.text,
        ),
        MarkdownFormField(
          onChanged: (value) => setState(() {
            createeventDescriptionController.text = value;
          }),
          autoCloseAfterSelectEmoji: false,
          controller: createeventDescriptionController,
          focusNode: _focusNode,
          enableToolBar: true,
          emojiConvert: true,
        )
      ]),
    );
  }
}
