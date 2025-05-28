import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wtms/components/my_button2.dart';
import 'package:wtms/models/task.dart';
import 'package:wtms/service/config.dart';

class SubmitCompletionScreen extends StatefulWidget {
  final Task task;
  const SubmitCompletionScreen({super.key, required this.task});

  @override
  State<SubmitCompletionScreen> createState() => _SubmitCompletionScreenState();
}

class _SubmitCompletionScreenState extends State<SubmitCompletionScreen> {
  final TextEditingController _completionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text(
          'Task ID: ${widget.task.id}',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
            letterSpacing: 2,
            fontFamily: 'Serif',
          ),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Title:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Serif',
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.task_alt, size: 30),
                const SizedBox(width: 10),
                Text(
                  widget.task.title ?? '',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Serif',
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // TextField for task completion input
            TextField(
              controller: _completionController,
              maxLines: 6,
              maxLength: 100,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.type_specimen),
                label: const Text('What did you complete?'),
                hintText: 'List the tasks you completed',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            MyButton2(
              text: 'SUBMIT',
              onTap: () {
                submitWorkDialog();
              },
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }

  void submitWorkDialog() {
    String submissionText = _completionController.text.trim();
    if (submissionText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Input cannot be empty. Please provide details.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Show confirmation dialog and call registerWorker() to proceed registration
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Confirm Submission',
              style: TextStyle(fontFamily: 'Serif'),
            ),
            content: const Text(
              'Are you sure you want to submit this completion?',
              style: TextStyle(fontSize: 16, fontFamily: 'Serif'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  submitWork();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }
  }

  Future<void> submitWork() async {
    var response = await http.post(
      Uri.parse('${Config.server}/submit_work.php'),
      body: {
        'work_id': widget.task.id.toString(),
        'worker_id': widget.task.assignedTo.toString(),
        'submission_text': _completionController.text.trim(),
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Submission successful!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data['message'] ?? 'Submission failed.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Network error. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
