import 'package:flutter/foundation.dart';

import '../User.dart';

const TAG = "JuReminder: ";

class Basic {
  const Basic();

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
}
