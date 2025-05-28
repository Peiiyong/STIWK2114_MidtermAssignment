import 'package:flutter/material.dart';
import 'package:wtms/components/my_drawer.dart';
import 'package:wtms/models/worker.dart';
import 'package:wtms/view/task_list_screen.dart';

// Home screen showing the worker's profile and allowing edit options
class HomeScreen extends StatefulWidget {
  final Worker worker;
  const HomeScreen({super.key, required this.worker});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text(
          'W T M S',
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

      // Drawer is a side menu that can be opened by swiping from the left or tapping the menu icon
      drawer: MyDrawer(worker: widget.worker),

      body: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          right: 30,
          left: 30,
          bottom: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20),
          width: 350,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskListScreen(worker: widget.worker),
                ),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  height: 100,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(height: 10),
                Text(
                  'Task',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                    letterSpacing: 5,
                    fontFamily: 'Serif',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
