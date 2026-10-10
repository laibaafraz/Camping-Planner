# Camping and Outdoor Adventure Planner

A simple Flutter app for planning and organizing camping trips. It includes trip planning, a packing checklist, location information and survival tips.

## Features

| Screen | What it does |
|---|---|
| **Trips** | Save trips with a name, place, number of days and number of people. Delete trips you no longer need. |
| **Packing** | Starter checklist of 22 camping essentials with a progress bar. Tick items off, add your own, swipe to remove, or reset the list. |
| **Locations** | Choose a terrain (forest, mountains, lake or river, desert, beach) to see the best time to go, water access, hazards and a camp tip. |
| **Tips** | Expandable survival guides: water, shelter, fire, getting lost, first aid and wildlife. |

Trips and the packing list are saved on the device, so they are still there when you reopen the app.

## Requirements

- [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.10 or newer (Dart 3)
- An emulator, a physical device, or Chrome for web

Check your setup with:

```bash
flutter doctor
```

## Getting started

1. Create a new Flutter project:

   ```bash
   flutter create camping_planner
   cd camping_planner
   ```

2. Copy this project's `lib/` folder and `pubspec.yaml` into the new project, replacing the existing ones.

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

## Project structure

```
lib/
├── main.dart                  App entry point and theme
├── screens/
│   ├── home_screen.dart       Bottom navigation between screens
│   ├── trips_screen.dart      Plan and save trips
│   ├── packing_screen.dart    Packing checklist
│   ├── locations_screen.dart  Terrain information
│   └── tips_screen.dart       Survival tips
├── data/
│   ├── packing_data.dart      Starter packing items
│   ├── location_data.dart     Terrain details
│   └── tips_data.dart         Survival tip content
└── services/
    └── storage.dart           Save and load using shared_preferences
```

## Customizing

- **Change the packing items:** edit the list in `lib/data/packing_data.dart`.
- **Add a terrain:** add an entry to the `locations` map in `lib/data/location_data.dart`.
- **Add or edit tips:** edit the `tips` map in `lib/data/tips_data.dart`.
- **Change the theme color:** change the `colorSchemeSeed` value in `lib/main.dart`.

## Dependencies

- [`shared_preferences`](https://pub.dev/packages/shared_preferences) for saving data on the device

## Safety note

The location information and survival tips are general guidance only. Before any trip, check local rules and permits, the weather forecast and current conditions, and tell someone your plan.

## Ideas for next steps

- Weather forecast for the trip location
- Trip dates with a date picker
- Separate packing lists for each trip
- Meal and food planner
- Trip budget tracker
