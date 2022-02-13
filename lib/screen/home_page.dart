import 'package:flutter/material.dart';
import 'package:todo_supabase_flutter/api/api.dart';
import 'package:todo_supabase_flutter/model/todo_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TodoModel? res;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: res == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: res!.todos.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(res!.todos[index].title),
                  subtitle: Text(res!.todos[index].description),
                );
              },
            ),
    );
  }

  void getData() async {
    res = TodoModel.fromJson(await ApiRepository.getAllTodo());
    setState(() {});
  }
}
