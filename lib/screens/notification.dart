import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, dynamic>> tasks = [
    {'description': 'Fire at the poolside! Extinguishers needed!', 'priority': 'High'},
    {'description': 'Child lost at the reception', 'priority': 'Medium'},
    {'description': 'Room cleaning request at Room No 6', 'priority': 'Low'},
    {'description': 'First Aid supplies restock at the gym', 'priority': 'default'},
  ];

  List<Map<String, dynamic>> completedTasks = [];

  void markTaskAsCompleted(Map<String, dynamic> task) {
    setState(() {
      tasks.remove(task);
      completedTasks.add(task);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${task['description']} marked as completed.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            undoTask(task);
          },
        ),
      ),
    );
  }

  void undoTask(Map<String, dynamic> task) {
    setState(() {
      completedTasks.remove(task);
      tasks.add(task);
    });
  }

  double get progress {
    int totalTasks = tasks.length + completedTasks.length;
    if (totalTasks == 0) return 0;
    return completedTasks.length / totalTasks;
  }

  Color getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.redAccent;
      case 'Medium':
        return Colors.orangeAccent;
      case 'Low':
        return Colors.greenAccent;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF6D4C41),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xFF8D6E63), // Keeping original background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress Indicator Section
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF5D4037),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Task Progress',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(progress * 100).toStringAsFixed(0)}% completed',
                      style: const TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      color: const Color(0xFF3E2723), // Brown progress color
                      minHeight: 10,
                    ),
                  ],
                ),
              ),

              // "Task for The Day" Section
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF795548),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tasks for The Day',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...tasks.map((task) => buildTaskItem(task, 'Done')),
                  ],
                ),
              ),

              // "Task Completed" Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF795548),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Task Completed for The Day',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...completedTasks.map((task) => buildCompletedTask(task)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build Task Item with Priority and Done button
  Widget buildTaskItem(Map<String, dynamic> task, String buttonText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF6D4C41),
          border: Border.all(color: getPriorityColor(task['priority']), width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            '${task['description']} - Priority: ${task['priority']}',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          subtitle: const Text('Due Today', style: TextStyle(color: Colors.white70)),
          trailing: ElevatedButton(
            onPressed: () {
              markTaskAsCompleted(task);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3E2723),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  // Build Completed Task Item with Undo Button
  Widget buildCompletedTask(Map<String, dynamic> task) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF6D4C41),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          title: Text(
            task['description'],
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.undo, color: Colors.white),
            onPressed: () {
              undoTask(task);
            },
          ),
        ),
      ),
    );
  }
}