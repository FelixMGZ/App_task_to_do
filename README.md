# 📱 Offline Task Manager (Flutter + Firebase)

Una aplicación de productividad robusta que combina la velocidad del almacenamiento local con la seguridad de la autenticación en la nube. Diseñada bajo principios de **Clean Architecture** y enfoque **Offline-First**. 

Rápida y eficiente que permite gestionar tareas diarias. Este proyecto implementa un ciclo **CRUD completo** (Crear, Leer, Actualizar, Borrar) y utiliza una base de datos NoSQL local para persistencia de datos, asegurando que la información no se pierda al cerrar la app.

<img src="https://github.com/FelixMGZ/App_task_to_do/blob/main/imagen/Screenshot_1765996186.png" alt="Captura de pantalla de la aplicación" width="250"/>   <img src="https://github.com/FelixMGZ/App_task_to_do/blob/main/imagen/Screenshot_1765822710.png" alt="Captura de pantalla de la aplicación" width="250"/>

## ✨ Características Principales

* **🔐 Autenticación Segura:** Sistema de Login integrado con **Google Sign-In** y **Firebase Authentication** para proteger el acceso.
* **Persistencia de Datos Local:** Integración con **Hive**, una base de datos ligera y ultrarrápida para Flutter.
* **CRUD Completo:** Funcionalidad total para agregar tareas, marcarlas como completadas y eliminarlas permanentemente.
* **Interfaz Reactiva:** Uso de `ValueListenableBuilder` para actualizar la interfaz de usuario instantáneamente cuando la base de datos cambia, sin necesidad de recargar manualmente.
* **UX optimizada:** Diálogos modales para entrada de datos y retroalimentación visual inmediata (tachado de tareas).

## 🛠️ Tecnologías Utilizadas

* **Framework:** [Flutter](https://flutter.dev/)
* **Base de Datos:** [Hive](https://docs.hivedb.dev/) (NoSQL Key-Value database) Hive & Hive Flutter.
* **Backend & Auth:** Firebase Core, Firebase Auth
* **Plugins:** Google Sign In, Path Provider
* **Gestión de Archivos:** `path_provider` para gestión segura de directorios en Android/iOS.

## 🧠 Habilidades demostradas

Este proyecto destaca mi capacidad para construir aplicaciones funcionales con lógica de negocio real:
1.  Implementación de bases de datos locales para funcionamiento offline.
2.  Gestión eficiente del ciclo de vida de la aplicación (inicialización asíncrona en `main`).
3.  Manejo de lógica de actualización y borrado de datos en tiempo real.

## 🔧 Cómo ejecutar este proyecto

1.  Clona el repositorio:
    ```bash
    git clone https://github.com/FelixMGZ/App_task_to_do
    ```
2.  Instala las dependencias:
    ```bash
    flutter pub get
    ```
3.  Ejecuta la aplicación:
    ```bash
    flutter run
    ```

---
**Desarrollado por [FelixMGZ](https://github.com/FelixMGZ)** - *Desarrollador Flutter Junior disponible para proyectos freelance.*
