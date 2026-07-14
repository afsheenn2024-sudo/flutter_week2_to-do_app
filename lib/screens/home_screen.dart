import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Controller
  final TextEditingController taskController = TextEditingController();

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      backgroundColor: Colors.teal.shade50,

      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        centerTitle: true,
        title: const Text(
          "To-Do App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            // COUNTER CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.teal.shade700,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children: [

                  Text(
                    "Counter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "${taskProvider.counter}",
                    style: const TextStyle(
                      fontSize: 55,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ElevatedButton(
                        onPressed: taskProvider.decreaseCounter,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade50,
                          foregroundColor: Colors.teal.shade700,
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(Icons.remove),
                      ),

                      const SizedBox(width: 20),

                      ElevatedButton(
                        onPressed: taskProvider.increaseCounter,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade50,
                          foregroundColor: Colors.teal.shade700,
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // TITLE
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My Tasks",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                ),
              ),
            ),

            const SizedBox(height: 20),
            // INPUT FIELD
            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: "Enter a task",
                      prefixIcon: Icon(
                        Icons.edit_note,
                        color: Colors.teal.shade700,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () async {
                    if (taskController.text.trim().isEmpty) return;

                    await taskProvider.addTask(taskController.text);

                    taskController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade700,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Add"),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // TASK LIST
            Expanded(
              child: taskProvider.tasks.isEmpty
                  ? const Center(
                child: Text(
                  "No Tasks Yet",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
              )
                  : ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: const Icon(
                        Icons.task_alt,
                        color: Colors.teal,
                      ),
                      title: Text(taskProvider.tasks[index]),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          taskProvider.deleteTask(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
