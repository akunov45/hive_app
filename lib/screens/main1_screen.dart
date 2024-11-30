import 'package:flutter/material.dart';
import 'package:hive_app/core/theme/app_colors.dart';
import 'package:hive_app/data/todos.dart';
import 'package:hive_app/screens/second_screen.dart';
import 'package:hive_app/widgets/widget_calendar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  late Box<Todos> todosBox;

  @override
  void initState() {
    super.initState();
    // Открытие коробки при инициализации виджета
    todosBox = Hive.box<Todos>('todos');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.add_box,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          const SizedBox(
            height: 140,
            child: WidgetCalendar(
              color: AppColors.primaryColorLight,
            ),
          ),
          ContainerBody(todosBox: todosBox),
        ],
      ),
    );
  }
}

List<Color> colors = [
  Colors.deepPurple,
  Colors.red,
  Colors.blue,
  Colors.amberAccent
];

// class ContainerBody extends StatelessWidget {
//   final Box<Todos> todosBox;

//   const ContainerBody({super.key, required this.todosBox});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
//         decoration: const BoxDecoration(
//           color: AppColors.whiteColor,
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(30), topLeft: Radius.circular(30)),
//         ),
//         child: CustomScrollView(
//           slivers: [
//             const SliverToBoxAdapter(
//               child: Text(
//                 'Add Tasks',
//                 style: TextStyle(
//                     height: 3,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.blackColor),
//               ),
//             ),
//             SliverFixedExtentList(
//               itemExtent: 150,
//               delegate: SliverChildBuilderDelegate(
//                 childCount: 7,
//                 (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 20),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Column(
//                           children: [
//                             const CircleAvatar(
//                               radius: 13,
//                               backgroundColor: AppColors.primaryColor,
//                               child: Icon(Icons.done, color: Colors.white),
//                             ),
//                             for (int i = 0; i < 10; i++)
//                               Container(
//                                 height: 5,
//                                 margin: const EdgeInsets.only(
//                                     bottom: 2.5, top: 2.5),
//                                 width: 2,
//                                 color: Colors.deepPurple,
//                               ),
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                           child: Container(
//                             height: 150,
//                             decoration: BoxDecoration(
//                               color: Colors.deepPurple,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 10, left: 20, right: 20),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   const Text(
//                                     '09:00 - 10:00',
//                                     style:
//                                         TextStyle(color: AppColors.whiteColor),
//                                   ),
//                                   const Text(
//                                     'Meeting with Jhon Doe',
//                                     style: TextStyle(
//                                         color: AppColors.whiteColor,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       const Text(
//                                         '30 Minutes',
//                                         style: TextStyle(
//                                             color: AppColors.whiteColor),
//                                       ),
//                                       // const Spacer(),
//                                       ElevatedButton(
//                                         onPressed: () {},
//                                         style: ElevatedButton.styleFrom(
//                                             backgroundColor: Colors.blueAccent,
//                                             minimumSize: const Size(0, 15)),
//                                         child: const Text(
//                                           'Completed',
//                                           style: TextStyle(fontSize: 14),
//                                         ),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class ContainerBody extends StatelessWidget {
  final Box<Todos> todosBox;

  const ContainerBody({super.key, required this.todosBox});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: ValueListenableBuilder(
          valueListenable: todosBox
              .listenable(), // Обновляет UI при изменении данных в коробке
          builder: (context, Box<Todos> box, _) {
            if (box.isEmpty) {
              return const Center(
                child: Text(
                  'No tasks added',
                  style: TextStyle(fontSize: 18, color: AppColors.blackColor),
                ),
              );
            }

            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Text(
                    'Tasks',
                    style: TextStyle(
                        height: 3,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor),
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 150,
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final todo =
                          box.getAt(index); // Получаем задачу по индексу
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 13,
                                  backgroundColor:
                                      Color(todo!.color), // Динамический цвет
                                  child: const Icon(Icons.done,
                                      color: Colors.white),
                                ),
                                for (int i = 0; i < 10; i++)
                                  Container(
                                    height: 5,
                                    margin: const EdgeInsets.only(
                                        bottom: 2.5, top: 2.5),
                                    width: 2,
                                    color: Color(todo.color),
                                  ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Color(todo.color),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${todo.startTimeHour}:${todo.startTimeMinute} - ${todo.endTimeHour}:${todo.endTimeMinute}',
                                        style: const TextStyle(
                                            color: AppColors.whiteColor),
                                      ),
                                      Text(
                                        todo.name,
                                        style: const TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Task Details',
                                            style: TextStyle(
                                                color: AppColors.whiteColor),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              box.deleteAt(
                                                  index); // Удаление задачи
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.blueAccent,
                                                minimumSize: const Size(0, 15)),
                                            child: const Text(
                                              'Completed',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    childCount: box.length, // Количество задач
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
