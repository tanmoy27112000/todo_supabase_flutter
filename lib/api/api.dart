import 'package:todo_supabase_flutter/api/base_api.dart';

class ApiRepository {
  static ApiHelper apiHelper =
      ApiHelper(baseUrl: "https://todo-flutter-supabase.herokuapp.com/");

  static getAllTodo() async {
    Map res = await apiHelper.getRequest("all-todo");
    return res;
  }
}
