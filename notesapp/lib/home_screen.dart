import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController controller = TextEditingController();
  final box = Hive.box('notesBox');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Notes App")),

      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Enter Note",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {

                    box.add(controller.text);
                    controller.clear();
                    setState(() {});
                  },
                )
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {

                final note = box.getAt(index);

                return ListTile(
                  title: Text(note),

                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      box.deleteAt(index);
                      setState(() {});
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}