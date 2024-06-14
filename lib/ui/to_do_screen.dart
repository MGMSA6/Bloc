import 'package:bloc_example/blocs/todo_bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todo App"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(child: Text("No Todo List"));
          } else if (state.todoList.isNotEmpty) {
            return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todoList[index]),
                    trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<TodoBloc>().add(
                              RemoveTodoEvent(task: state.todoList[index]));
                        }),
                  );
                });
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 5; i++) {
            context.read<TodoBloc>().add(AddTodoEvent(task: 'Task $i'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
