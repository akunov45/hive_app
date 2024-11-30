import 'package:flutter/material.dart';
import 'package:hive_app/widgets/widget_calendar.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final List<Color> colors = [
    const Color( 0xFF7963FF),
    const Color( 0xFF50BEFF),
    const Color( 0xFF51CAC2),
    const Color( 0xFFFEA79A),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4044C9),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: const Color(0xFF4044C9),
            child: const Text(
              'Add Task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WidgetCalendar(),
                  const SizedBox(height: 20),
                  const Text(
                    'Task Name',
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Color(0xFFF2F2F2), // Set the background color
                      filled: true, // Show the fill color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Start Time',
                            style: TextStyle(fontSize: 22),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(),
                            ),
                            child:  const Row(
                              children: [
                                Text('16 : 00'),
                                SizedBox(width: 20,),
                                Icon(Icons.access_time_outlined)
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Start Time',
                            style: TextStyle(fontSize: 22),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(),
                            ),
                            child: const Row(
                              children: [
                                Text('17 : 00'),
                                SizedBox(width: 20,),
                                Icon(Icons.access_time_outlined)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Color',
                    style: TextStyle(fontSize: 22),
                  ),
                  Row(
                    children: [
                      for (Color color in colors)
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: color,
                          ),
                          child: const Text(''),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4044C9),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 40.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        child:  const Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
