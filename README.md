# restaruant_don_jarry

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


arquitectura
lib/
├── app/
│   ├── router.dart              # Configuración de navegación global (GoRouter)
│   ├── theme.dart               # Temas (Material 3)
│   ├── di.dart                  # Inyección de dependencias
│   └── app.dart                 # Punto principal de la app (MyApp)
│
├── core/
│   ├── constants/               # Constantes globales (URLs, colores, etc.)
│   ├── errors/                  # Manejo de errores (Failure, Exception)
│   ├── network/                 # Configuración de red (Dio client, interceptors)
│   ├── usecases/                # Casos de uso comunes (si se comparten entre features)
│   └── utils/                   # Funciones o helpers generales
│
├── features/
│   ├── auth/                    # Feature: Autenticación
│   │   ├── data/
│   │   │   ├── datasources/     # Clases que obtienen datos (API, local)
│   │   │   ├── models/          # Modelos (DTOs, json_serializable)
│   │   │   └── repositories_impl/ # Implementación de repositorios
│   │   ├── domain/
│   │   │   ├── entities/        # Entidades puras del dominio
│   │   │   ├── repositories/    # Interfaces abstractas
│   │   │   └── usecases/        # Casos de uso
│   │   └── presentation/
│   │       ├── providers/       # State management (Riverpod)
│   │       ├── screens/         # Pantallas principales (UI)
│   │       └── widgets/         # Componentes visuales
│   │
│   ├── home/                    # Otro módulo (ejemplo: inicio)
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── ...                      # Más módulos (perfil, productos, etc.)
│
├── shared/
│   ├── widgets/                 # Widgets reutilizables
│   └── services/                # Servicios globales (por ejemplo: storage, logger)
│
└── main.dart                    # Entry point
