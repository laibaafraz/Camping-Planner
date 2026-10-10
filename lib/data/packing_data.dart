import '../services/storage.dart';

const starterItems = [
  'Tent', 'Sleeping bag', 'Sleeping mat', 'Flashlight / headlamp',
  'Extra batteries', 'Water bottles', 'Water filter', 'Food and snacks',
  'Stove and fuel', 'Lighter / matches', 'Cooking pot and utensils',
  'First aid kit', 'Map and compass', 'Rain jacket', 'Warm layers',
  'Extra socks', 'Sun hat and sunscreen', 'Insect repellent',
  'Knife / multitool', 'Rope', 'Trash bags', 'Power bank',
];

Rows starterRows() =>
    starterItems.map((t) => <String, dynamic>{'t': t, 'd': false}).toList();
