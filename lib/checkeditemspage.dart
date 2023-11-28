import 'package:flutter/material.dart';

class CheckedItemsPage extends StatelessWidget {
  final List<TodoItem> checkedItems;

  CheckedItemsPage(this.checkedItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Done Tasks"),
        centerTitle: true,
      ),
      body:Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('image22.jpg'),
              fit: BoxFit.cover,
            ),
        ),
        child: ListView.builder(
          itemCount: checkedItems.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white54,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
              title: Text(checkedItems[index].task)
             ),
            );
          },
        ),
      )
    );
  }
}
class TodoItem {
  final String task;
  bool isChecked;

  TodoItem({required this.task, required this.isChecked});
}

