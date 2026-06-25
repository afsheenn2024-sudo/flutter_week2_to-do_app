import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Counter Variable
  int counter = 0;

  // Tasks List
  List<String> tasks = [];

  // Controller
  final TextEditingController taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // Load Data from SharedPreferences
  Future<void> loadData() async {
    counter = await StorageService.getCounter();
    tasks = await StorageService.getTasks();
    setState(() {});
  }

  // Increase Counter
  void increaseCounter() async {
    setState(() {
      counter++;
    });
    await StorageService.saveCounter(counter);
  }

  // Decrease Counter
  void decreaseCounter() async {
    if (counter > 0) {
      setState(() {
        counter--;
      });

      await StorageService.saveCounter(counter);
    }
  }

  // Add Task
  void addTask() async {
    if (taskController.text.trim().isEmpty) return;

    setState(() {
      tasks.add(taskController.text.trim());
    });

    taskController.clear();
    await StorageService.saveTasks(tasks);
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

                  const Text(
                    "Counter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "$counter",
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
                        onPressed: decreaseCounter,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade50,
                          foregroundColor: Colors.teal.shade700,
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(Icons.remove),
                      ),

                      const SizedBox(width: 20),

                      ElevatedButton(
                        onPressed: increaseCounter,
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
                  onPressed: addTask,
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
              child: tasks.isEmpty
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
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: const Icon(
                        Icons.task_alt,
                        color: Colors.teal,
                      ),
                      title: Text(tasks[index]),
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