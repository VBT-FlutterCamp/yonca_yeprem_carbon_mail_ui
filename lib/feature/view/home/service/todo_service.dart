import 'package:http/http.dart' as http;

import '../model/todo_model.dart';

class TodoService{
  String _url = "https://jsonplaceholder.typicode.com/todos"; 
  Future<List<TodoModel>> fetchPost() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return todoModelFromJson(response.body);
    } else {
      throw Exception("Data did not come");
    }
  }
}