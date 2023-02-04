[![pub package](https://img.shields.io/pub/v/map_to_directory_structure.svg)](https://pub.dev/packages/map_to_directory_structure)
[![Build Status](https://github.com/flutter-cavalry/map_to_directory_structure/workflows/Build/badge.svg)](https://github.com/flutter-cavalry/map_to_directory_structure/actions)

Creates directory structure based on a map. Reverse of [directory_structure_map](https://github.com/flutter-cavalry/directory_structure_map).

## Usage

- Use maps to represent a directory.
- Use hex strings to represent a file.

```dart
import 'package:map_to_directory_structure/map_to_directory_structure.dart';

var map = {
  'emptyDir': {},
  'root.txt': '6869',
  'a': {
    'b': {
      'c': {'root.txt': '64656570'},
      'd': ''
    }
  }
};
await mapToDirectoryStructure(map, tmpDir);
```

This creates the following directory structure:

```
├── a
│   └── b
│       ├── c
│       │   └── root.txt
│       └── d
├── emptyDir
└── root.txt
```
