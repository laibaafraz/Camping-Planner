# Camping Planner (Flutter)

Folder structure:

lib/
  main.dart                  App entry point and theme
  screens/
    home_screen.dart         Bottom navigation
    trips_screen.dart        Plan and save trips
    packing_screen.dart      Packing checklist
    locations_screen.dart    Terrain information
    tips_screen.dart         Survival tips
  data/
    packing_data.dart        Starter packing items
    location_data.dart       Terrain details
    tips_data.dart           Survival tip content
  services/
    storage.dart             Save/load with shared_preferences

Setup:
1. flutter create camping_planner
2. Copy this lib/ folder and pubspec.yaml into the new project (replace existing)
3. flutter pub get
4. flutter run
