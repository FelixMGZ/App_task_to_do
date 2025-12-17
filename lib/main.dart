import 'package:flutter/material.dart';
// 1. Importamos los paquetes que acabamos de instalar
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

// 2. Importamos nuestra pantalla de inicio (ahora será la de tareas)
import 'package:to_do_app/src/features/todo/todo_screen.dart';

// inizialize firebase
import 'package:firebase_core/firebase_core.dart';

import 'login_screen.dart';

// 3. ¡main() ahora es "async"!
Future<void> main() async {
  
  // 4. Necesitamos esta línea para asegurar que Flutter esté listo
  // antes de usar los paquetes (como path_provider)
  WidgetsFlutterBinding.ensureInitialized();

  // 5. Obtenemos el directorio legal para guardar la base de datos
  final appDocumentDir = await getApplicationDocumentsDirectory();

  // Inicializar Firebase (Esto conecta con el json que bajaste)
  await Firebase.initializeApp();

  // 6. ¡Inicializamos Hive en esa carpeta!
  await Hive.initFlutter(appDocumentDir.path);

  // 7. Abrimos nuestra "caja" (Box) donde guardaremos las tareas
  // Si no existe, la crea.
  await Hive.openBox('tareasBox');

  // 8. Ahora sí, ejecutamos la app
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(), 
    );
  }
}