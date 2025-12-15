import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final _taskController = TextEditingController();
  final _tareasBox = Hive.box('tareasBox');

  // FUNCIÓN: Guardar nueva tarea (Create)
  void _saveNewTask() {
    if (_taskController.text.isNotEmpty) {
      _tareasBox.add({
        'title': _taskController.text,
        'isCompleted': false,
      });
      _taskController.clear();
      Navigator.of(context).pop();
    }
  }

  // FUNCIÓN: Borrar tarea (Delete)
  void _deleteTask(int index) {
    _tareasBox.deleteAt(index);
  }

  // FUNCIÓN: Marcar como completada (Update)
  void _toggleTask(int index, Map<dynamic, dynamic> task) {
    // 1. Invertimos el valor de 'isCompleted'
    bool isCompleted = !task['isCompleted'];
    
    // 2. Guardamos el cambio en la MISMA posición (index)
    _tareasBox.putAt(index, {
      'title': task['title'],
      'isCompleted': isCompleted,
    });
  }

  // Diálogo para crear tarea
  void _createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Nueva Tarea'),
          content: TextField(
            controller: _taskController,
            decoration: const InputDecoration(hintText: 'Escribe algo...'),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: _saveNewTask,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, foregroundColor: Colors.white),
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Tareas'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewTask,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      
      // AQUÍ ESTÁ LA MAGIA: ValueListenableBuilder
      // Escucha los cambios en la caja 'tareasBox'
      body: ValueListenableBuilder(
        valueListenable: _tareasBox.listenable(),
        builder: (context, Box box, widget) {
          
          // Si no hay tareas, mostramos un mensaje bonito
          if (box.isEmpty) {
            return const Center(
              child: Text('¡No tienes tareas pendientes! \n Pulsa + para agregar.', 
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            );
          }

          // Si hay tareas, mostramos la lista
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              // 1. Obtenemos la tarea en esta posición
              // Usamos 'as Map' para que Dart sepa que es un mapa de datos
              final task = box.getAt(index) as Map;

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  // LEADING: El Checkbox para marcar como completado
                  leading: Checkbox(
                    value: task['isCompleted'],
                    activeColor: Colors.teal,
                    onChanged: (value) => _toggleTask(index, task),
                  ),
                  
                  // TITLE: El texto de la tarea
                  title: Text(
                    task['title'],
                    // Si está completada, la tachamos visualmente
                    style: TextStyle(
                      decoration: task['isCompleted'] 
                          ? TextDecoration.lineThrough 
                          : null,
                      color: task['isCompleted'] ? Colors.grey : Colors.black,
                    ),
                  ),
                  
                  // TRAILING: El botón de borrar (Basurero)
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () => _deleteTask(index),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}