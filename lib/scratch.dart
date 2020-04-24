void main() {
  performTask();
}
void performTask() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'Task 1 data';
  print('Task 1 completed of $result');
}
Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;
  await Future.delayed(threeSeconds, () {
  result = 'Task 2 data';
  print('Task 2 completed');
  });
    return result;
}

void task3(String task2Result) {
  String result = 'Task 3 data ';
  print('Task 3 completed with $task2Result after $result');
}
