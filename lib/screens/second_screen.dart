import 'package:flutter/material.dart';
import 'package:hive_app/core/theme/app_colors.dart';
import 'package:hive_app/widgets/widget_calendar.dart';

import '../core/service/service.dart';
import '../data/todos.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _key = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();

  TimeOfDay startTime = const TimeOfDay(hour: 16, minute: 05);
  TimeOfDay endTime = const TimeOfDay(hour: 16, minute: 00);

  int _value = 0;
  List<int> colors = [0xFF7963FF, 0xFF50BEFF, 0xFF51CAC2, 0xFFFEA79A];

  void addData(Todos todo) async {
    if (_key.currentState!.validate()) {
      await todosData.add(todo);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.indigo,
      body: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Add Task',
                style: TextStyle(
                    fontSize: 22, height: 3, color: AppColors.whiteColor),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WidgetCalendar(
                      color: AppColors.grayColor,
                      dayColor: AppColors.blackColor,
                      activeColor: AppColors.primaryColor,
                      activeDayColor: AppColors.whiteColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          textWidget(text: 'Task Name'),
                          const SizedBox(height: 10),

                          TextFormField(
                            controller: titleController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none),
                              // focusedBorder: InputBorder.none,
                              fillColor: AppColors.grayColor,
                              filled: true,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textWidget(text: 'Start Time'),
                                  setTimeWidget(
                                      time:
                                          '${startTime.hour}:${startTime.minute}',
                                      onTap: () async {
                                        TimeOfDay? pickedTime =
                                            await showTimePicker(
                                                context: context,
                                                initialTime: startTime);
                                        if (pickedTime == null) return;
                                        setState(() {
                                          startTime = pickedTime;
                                        });
                                      }),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textWidget(text: 'End Time'),
                                  setTimeWidget(
                                      time: '17:00',
                                      onTap: () async {
                                        TimeOfDay? pickedTime =
                                            await showTimePicker(
                                                context: context,
                                                initialTime: endTime);
                                        if (pickedTime == null) return;
                                        setState(() {
                                          endTime = pickedTime;
                                        });
                                      }),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          textWidget(text: 'Color'),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              itemCount: colors.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ChoiceChipWidget(
                                    index: index,
                                    value: _value,
                                    onSelected: (bool? value) {
                                      setState(
                                        () {
                                          _value = index;
                                        },
                                      );
                                    },
                                    colors: colors);
                              },
                            ),
                          ),

                          // const ChoiceChipWidget(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  addData(Todos(
                                    startTimeMinute: startTime.minute,
                                    endTimeHour: endTime.hour,
                                    endTimeMinute: endTime.minute,
                                    name: titleController.text,
                                    color: colors[_value],
                                    startTimeHour: startTime.hour,
                                  ));
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: AppColors.primaryColor),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  child: Text(
                                    'Add',
                                    style:
                                        TextStyle(color: AppColors.whiteColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget textWidget({
  required String text,
}) {
  return Text(
    text,
    style: const TextStyle(
      color: AppColors.blackColor,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
  );
}

Widget setTimeWidget({required String time, required Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.only(top: 10),
      height: 60,
      width: 160,
      decoration: BoxDecoration(
          color: AppColors.grayColor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          textWidget(text: time),
          const Spacer(),
          const Icon(Icons.access_time)
        ],
      ),
    ),
  );
}

class ChoiceChipWidget extends StatelessWidget {
  final int index;
  final int value;
  final List<int> colors;

  final Function(bool)? onSelected;

  const ChoiceChipWidget({
    super.key,
    required this.index,
    required this.value,
    required this.colors,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      shape: CircleBorder(
        side: BorderSide(
          width: 2,
          color: Color(colors[index]),
        ),
      ),
      label: value == index ? const Icon(Icons.check) : Container(),
      selected: value == index,
      onSelected: onSelected,
      showCheckmark: false,
      selectedColor: Colors.transparent,
      backgroundColor: Color(colors[index]),
      // disabledColor: Colors.red,
    );
  }
}
