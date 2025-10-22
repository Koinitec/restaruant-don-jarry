# Restaruante Don Jarry

Aplicación móvil desarrollada en **Flutter**, diseñada para la gestión del restaurante *Don Jarry*.
Implementa **arquitectura limpia (Clean Architecture + DDD)**, navegación con **GoRouter**, manejo de estado con **Riverpod** e integración modular.

---

## Tecnologías principales

* **Flutter 3.x** — Framework multiplataforma
* **Dart** — Lenguaje base del proyecto
* **GoRouter** — Sistema de rutas y navegación
*  **Riverpod** — Manejo de estado reactivo
* **Dio** — Cliente HTTP con interceptores
*  **Clean Architecture / DDD** — Separación por capas y responsabilidades

---

##  Estructura del proyecto

```
lib/
├── app/
│   ├── router.dart              # Configuración de navegación global (GoRouter)
│   ├── theme.dart               # Temas y estilos (Material 3)
│   ├── di.dart                  # Inyección de dependencias
│   └── app.dart                 # Punto principal de la app (MyApp)
│
├── core/
│   ├── constants/               # Constantes globales (URLs, colores, etc.)
│   ├── errors/                  # Manejo de errores (Failure, Exception)
│   ├── network/                 # Configuración de red (Dio client, interceptors)
│   ├── usecases/                # Casos de uso comunes compartidos
│   └── utils/                   # Funciones y helpers generales
│
├── features/
│   ├── auth/                    # Módulo: Autenticación
│   │   ├── data/
│   │   │   ├── datasources/     # Fuentes de datos (API, local)
│   │   │   ├── models/          # Modelos (DTOs, JSON)
│   │   │   └── repositories_impl/ # Implementación de repositorios
│   │   ├── domain/
│   │   │   ├── entities/        # Entidades puras del dominio
│   │   │   ├── repositories/    # Interfaces abstractas
│   │   │   └── usecases/        # Casos de uso específicos
│   │   └── presentation/
│   │       ├── providers/       # State management (Riverpod)
│   │       ├── screens/         # Pantallas principales (UI)
│   │       └── widgets/         # Componentes visuales
│   │
│   ├── home/                    # Otro módulo (inicio)
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── ...                      # Más módulos (perfil, productos, pedidos, etc.)
│
├── shared/
│   ├── widgets/                 # Widgets reutilizables
│   └── services/                # Servicios globales (storage, logger, etc.)
│
└── main.dart                    # Entry point principal
```

---

## Instalación y ejecución

1. Clona el repositorio:

   ```bash
   git clone https://github.com/tu_usuario/restaurant_don_jarry.git
   ```

2. Instala las dependencias:

   ```bash
   flutter pub get
   ```

3. Ejecuta el proyecto:

   ```bash
   flutter run
   ```
   
## 📘 Recursos útiles
* [Documentación oficial de Flutter](https://docs.flutter.dev/)
* [Codelab: Tu primera app Flutter](https://docs.flutter.dev/get-started/codelab)
* [Cookbook de Flutter](https://docs.flutter.dev/cookbook)
* [ForUI.dev – Componentes y UI para Flutter](https://forui.dev/)
