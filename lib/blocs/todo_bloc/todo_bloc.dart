import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];

  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
  }

  void _addTodoEvent(AddTodoEvent event, Emitter<TodoState> states) {
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void _removeTodoEvent(RemoveTodoEvent event, Emitter<TodoState> states) {
    todoList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
