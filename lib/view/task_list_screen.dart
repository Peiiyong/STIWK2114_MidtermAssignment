import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wtms/models/task.dart';
import 'package:wtms/models/worker.dart';
import 'package:wtms/service/config.dart';
import 'package:wtms/view/submitCompletion_screen.dart';

class TaskListScreen extends StatefulWidget {
  final Worker worker;
  const TaskListScreen({super.key, required this.worker});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> taskList = <Task>[];

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text(
          'TASK LIST',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
            letterSpacing: 5,
            fontFamily: 'Serif',
          ),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            final task = taskList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: Theme.of(context).colorScheme.tertiary,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.task,
                              size: 48,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task.title ?? '',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    fontFamily: 'Serif',
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Task ID: ${task.id ?? '-'}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).colorScheme.primary,
                                    fontFamily: 'Serif',
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Icon(	Icons.upload, color: Theme.of(context).colorScheme.onPrimary,),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SubmitCompletionScreen(task: task,),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          task.description ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimary.withOpacity(0.85),
                            fontFamily: 'Serif',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 18,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Assigned: ${task.dateAssigned ?? '-'}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.primary,
                                fontFamily: 'Serif',
                              ),
                            ),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.event,
                              size: 18,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Due: ${task.dueDate ?? '-'}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.primary,
                                fontFamily: 'Serif',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.info,
                              size: 18,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Status: ${task.status ?? '-'}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                                fontFamily: 'Serif',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> fetchTasks() async {
    final response = await http.post(
      Uri.parse('${Config.server}/get_works.php'),
      body: {"worker_id": widget.worker.id.toString()},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      taskList.clear();
      for (var item in data) {
        Task t = Task.fromJson(item);
        taskList.add(t);
      }
      setState(() {});
    } else {
      print("Error: ${response.statusCode}");
    }
  }
}
