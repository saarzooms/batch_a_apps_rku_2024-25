import 'package:http/http.dart' as http;
import '../models/todo.dart';

class APICall {
  static fetchTodos() async {
    print('called fetchTodos');
    var request = http.Request(
        'GET', Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      print(res);
      var todos = todoFromJson(res);
      print(todos.length);
    } else {
      print('error in response ${response.reasonPhrase}');
    }
  }
}
