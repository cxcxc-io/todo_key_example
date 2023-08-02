import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList(this.todos, {required this.deleteTodo, super.key});
  final List<Todo> todos;
  final Function deleteTodo;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      // shrinkWrap: true 使列表在滾動方向上儘可能地壓縮，這將導致ListView將自己的大小匹配到子部件的大小。
      shrinkWrap: true,
      // onReorder 屬性是一個回調函數，當列表中的一個項目被拖放到一個新的位置時，將調用該函數。
      onReorder: (oldIndex, newIndex) {
        // 將當前的狀態包裹在setState函數中，這將確保當狀態改變時，該部件將被重建，以反映新的狀態。
        setState(() {
          // 如果新的位置在舊的位置之後，我們需要將其遞減，因為當我們從列表中移除一個項目時，後面的項目的索引將減少。
          // 從舊位置移除項目
          if (newIndex > oldIndex) {
            newIndex -= 1;
            print("newIndex: $newIndex");
            print("oldIndex: $oldIndex");
          }
          final Todo removedItem = widget.todos.removeAt(oldIndex);
          // 在新位置插入項目
          widget.todos.insert(newIndex, removedItem);
        });
      },
      // 使用map函數和_buildTodoItem方法將每個todo物件轉換為一個ListTile部件，然後將結果轉換為列表，因為children屬性需要一個部件列表。
      children: widget.todos.map((todo) => _buildTodoItem(todo)).toList(),
    );
  }

  Widget _buildTodoItem(Todo todo) {
    final key = Key('todo-${todo.id}');
    return Dismissible(
      key: key,
      onDismissed: (direction) {
        setState(() {
          widget.todos.remove(todo);
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                '待辦事項: ${todo.title} 已移除,事項id: ${todo.id}, widget的靈魂id: ${key.hashCode}')));
      },
      child: ListTile(
        key: Key(todo.title),
        leading: Checkbox(
          value: todo.completed,
          onChanged: (value) {
            setState(() {
              todo.completed = value!;
            });
          },
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.completed ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}
