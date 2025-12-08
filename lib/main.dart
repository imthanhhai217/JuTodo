import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ju_reminder/MyTextView.dart';
import 'package:ju_reminder/User.dart';

const TAG = "JuReminder: ";

void main() {
  runApp(const MyApp());
  test();
}

void test() {
  // testDart();

  // testFunction();

  // functionHOF(() {
  //   testFunction();
  // });
  //
  // variableFunction();
  //
  // closureFunction();
  // testList();
}

void testList() {
  var list = [1, 2, 3, 4, 5];

  list.forEach((e) => print("$TAG Element: $e"));

  //Transform
  var square = list.map((e) => e * 2).toList();
  print(square);

  //Filter
  var evenNumbers = list.where((e) => e % 2 == 0).toList();
  print(evenNumbers);

  //Speared
  var list2 = [0, ...list, 6];
  print("Spread operator $list2");

  var showExtra = true;
  var list3 = [0, if (showExtra) 0.5, ...list, 6];
  print("Control Flow Collections $list3");

  var map2 = {"a": 1, "b": 2};

  map2.forEach((k, v) => print("$TAG Key: $k, Value: $v"));

  for (var i = 0; i < 10; i++) {}

  List.generate(10, (index) => print("$TAG Generated Value: $index"));

  List<Map<String, dynamic>> users = [
    {"name": "John", "age": 30},
    {"name": "Jane", "age": 25},
    {"name": "Bob", "age": 35},
  ];

  var dataUsers = List.generate(
    users.length,
    (index) => User.fromJson(users[index]),
  );
  dataUsers.forEach(
    (user) => print("$TAG User Name: ${user.name}, Age: ${user.age}"),
  );
}

void closureFunction() {
  print("$TAG Testing closure function");
  var myCounter = counter();
  print("$TAG Counter: ${myCounter()}"); // 0
  logMessage("${myCounter()}", TAG);
  logMessage2(message: "${myCounter()}", tag: TAG);
}

//Thêm ngoặc vuông để quy định tham số tùy chọn
void logMessage(String message, [String? tag]) {
  print("${tag ?? TAG} $message");
}

//Thêm ngoặc nhọn để quy định cho phép gán tham số theo tên
void logMessage2({required String message, String? tag = TAG}) {
  print("${tag ?? TAG} $message");
}

int Function() counter() {
  print("$TAG This is a closure function");
  int count = 0;
  return () {
    return count++;
  };
}

void variableFunction() {
  int operation(int a, int b) {
    return a * b;
  }

  print("$TAG Operation result: ${operation(5, 6)}");
}

void functionHOF(Function callback) {
  print("$TAG This is a higher-order function");
  if (kDebugMode) {
    callback();
  }
}

void testFunction() {
  print("$TAG Sum: ${sum(10, 20)}");
  print("$TAG Sum: ${sum("Hải", 20.3)}");
}

// Không nên dùng phép cộng dynamic
dynamic sum(dynamic a, dynamic b) {
  try {
    return a + b;
  } catch (e) {
    print(
      "$TAG Lỗi không thể cộng ${a.runtimeType} và ${b.runtimeType} \n Exception:$e",
    );
    //Có thể dùng throws để bắn exception
  }
}

void testDart() {
  final helloWorld = "$TAG Hello World";

  if (kDebugMode) {
    print(helloWorld);
  }

  int weight = 65;
  var height = 1.7;
  var bmi = weight / (height * height);

  print("$TAG Your BMI is: $bmi");

  var list = [1, 2, 3, 4, 5, "hello"];
  list[0] = 10;
  print("$TAG List: $list");

  var isRemoveComplete = list.remove(10);
  if (isRemoveComplete) {
    print("$TAG List after remove: $list");
  } else {
    print("$TAG Remove failed, item not found.");
  }

  list.insert(1, 1);
  print("$TAG List after insert: $list");

  Map<String, dynamic> map = {"name": "John", "age": 30, "isStudent": false};

  for (var key in map.keys) {
    print("$TAG Key: $key, Value: ${map[key]}");
  }

  int? number; // non-nullable variable

  print(number);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JuTodo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.cyanAccent)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      test();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: profileRow()),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  final AVATAR =
      "https://thumbs.dreamstime.com/b/funny-avatar-cunning-emoji-flat-vector-illustration-comic-yellow-social-media-sticker-humorous-cartoon-face-smiling-mouth-162122340.jpg";

  Row profileRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Image(image: NetworkImage(AVATAR, scale: 1.0)),
          flex: 1,
        ),
        Expanded(
          child: Text("Haisendbug", textAlign: TextAlign.center),
          flex: 2,
        ),
      ],
    );
  }

  Column demoColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.eighteen_mp),
            MyTextView(text: "Counter : "),
            MyTextView(text: _counter.toString()),
          ],
        ),

        Stack(
          children: [
            Container(width: 100, height: 100, color: Colors.blue),
            Positioned(
              top: 25,
              left: 25,
              child: Container(width: 50, height: 50, color: Colors.red),
            ),
          ],
        ),
      ],
    );
  }
}
