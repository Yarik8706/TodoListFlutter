import 'package:flutter/material.dart';
import 'package:flutter_todolist/models/task.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  String _newTaskTitle = '';
  String _newTaskDescription = '';
  List<Task> todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll([
      Task(title: 'buy milk', description: 'buy milk'),
      Task(title: 'buy milk', description: 'buy milk'),
      Task(title: 'buy milk', description: 'buy milk'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список дел'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todoList[index].title),
              child: Card(
                color: Colors.deepPurple,
                child: ListTile(
                  title: Text(todoList[index].title, style: Theme
                      .of(context)
                      .textTheme
                      .caption,),
                  subtitle: Text(todoList[index].description,
                    style: const TextStyle(color: Colors.white),),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
              onDismissed: (direction) {
                //if(direction == DismissDirection.startToEnd){}
                setState(() {
                  todoList.removeAt(index);
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _newTaskDescription = '';
          _newTaskTitle = '';
          showDialog(context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Добавить элемент', style: Theme.of(context).textTheme.subtitle1),
                  content: SizedBox(
                    height: 200,
                    child: Column(
                      children: [
                        Divider(
                          color: Theme.of(context).primaryColor
                        ),
                        TextField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Название',
                              hintText: 'Введите текст'
                          ),
                          onChanged: (String value) {
                            _newTaskTitle = value;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Описание',
                            hintText: 'Введите текст'
                          ),
                          onChanged: (String value) {
                            _newTaskDescription = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      child: Text('Отменить', style: Theme.of(context).textTheme.caption,),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      child: Text('Создать', style: Theme.of(context).textTheme.caption,),
                      onPressed: () {
                        if(_newTaskTitle == '' && _newTaskDescription == '') return;
                        setState(() {
                          todoList.add(Task(title: _newTaskTitle, description: _newTaskDescription));
                        });
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              }
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

