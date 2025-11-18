import 'package:flutter/material.dart';
import '../services/task_service.dart';

class AddEditTaskScreen extends StatefulWidget {
  final String? taskId;
  final String? existingTitle;
  final String? existingDescription;

  const AddEditTaskScreen({
    super.key,
    this.taskId,
    this.existingTitle,
    this.existingDescription,
  });

  @override
  State<AddEditTaskScreen> createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    titleController.text = widget.existingTitle ?? "";
    descController.text = widget.existingDescription ?? "";
    super.initState();
  }

  void saveTask() async {
    setState(() => isLoading = true);

    final title = titleController.text.trim();
    final desc = descController.text.trim();

    if (widget.taskId == null) {
      await TaskService.createTask(title, desc);
    } else {
      await TaskService.updateTask(widget.taskId!, title, desc);
    }

    Navigator.pop(context, true);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.taskId == null ? "Add Task" : "Edit Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: "Description"),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: saveTask,
                    child: const Text("Save"),
                  ),
          ],
        ),
      ),
    );
  }
}
