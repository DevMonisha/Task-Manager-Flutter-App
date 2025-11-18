import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/task_service.dart';
import 'add_edit_task_screen.dart';
import 'login_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List tasks = [];
  bool isLoading = false;

  @override
  void initState() {
    fetchTasks();
    super.initState();
  }

  Future<void> fetchTasks() async {
    setState(() => isLoading = true);

    tasks = await TaskService.getTasks();

    setState(() => isLoading = false);
  }

  void deleteTask(String id) async {
    await TaskService.deleteTask(id);
    fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tasks"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService.logoutUser();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => const LoginScreen()),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddEditTaskScreen(),
            ),
          );

          if (result == true) fetchTasks();
        },
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : tasks.isEmpty
              ? const Center(child: Text("No tasks found"))
              : ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    final id = task.objectId;
                    final String title = task.get("title") ?? "";
                    final String desc = task.get("description") ?? "";

                    return Card(
                      child: ListTile(
                        title: Text(title),
                        subtitle: Text(desc),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => AddEditTaskScreen(
                                      taskId: id,
                                      existingTitle: title,
                                      existingDescription: desc,
                                    ),
                                  ),
                                );

                                if (result == true) fetchTasks();
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => deleteTask(id),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
