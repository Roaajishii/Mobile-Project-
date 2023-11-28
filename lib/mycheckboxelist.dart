import 'package:flutter/material.dart';
import 'checkeditemspage.dart';

class MyCheckboxList extends StatefulWidget {
  const MyCheckboxList({super.key});

  @override
  _MyCheckboxListState createState() => _MyCheckboxListState();
}

class _MyCheckboxListState extends State<MyCheckboxList> {
  final _textController = TextEditingController();
  final List<TodoItem> items= [];
  final List<TodoItem> checkedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Task Tracker"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image22.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(labelText: 'Write Your Tasks ', ),
              ),
            ),
            SizedBox(height: 5.0,),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  items.add(TodoItem(task: _textController.text, isChecked: false));
                  _textController.clear();
                },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Add Task'),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                height: 40,
                width: 2000,
                color: Colors.green,
                child: Text('To Do List :', style: TextStyle(
                  fontSize: 18, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold, height: 1.5,
                  color: Colors.white,
                ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.green,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: CheckboxListTile(
                      title: Text(items[index].task),
                      value: items[index].isChecked,
                      onChanged: (value) {
                        setState(() {
                           items[index].isChecked = value ?? false;
                          if (value == true) {
                           checkedItems.add(items[index]);
                           items.removeAt(index);
                           }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(1.0),
                      tileColor: Colors.white54,
                      selectedTileColor: Colors.green[100],
                    ),
                  );
                }, //itembuilder
              ),
            ),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
          onPressed: () {
         Navigator.push(
             context,
           MaterialPageRoute(builder: (context) => CheckedItemsPage(checkedItems)),
             );
              },
            child: Icon(Icons.check),
             backgroundColor: Colors.green,
  ),
  );
  }
}


