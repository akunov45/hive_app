


import 'package:hive/hive.dart';

import '../../data/todos.dart';

final Box<Todos> todosData = Hive.box<Todos>('todos');