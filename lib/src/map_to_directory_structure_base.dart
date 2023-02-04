import 'dart:io';
import 'package:convert/convert.dart';
import 'package:path/path.dart' as p;

Future<void> mapToDirectoryStructure(
    Map<String, Object> map, String dirPath) async {
  await Directory(dirPath).create(recursive: true);
  await _writeMapInternal(map, dirPath);
}

Future<void> _writeMapInternal(Map<String, dynamic> map, String dirPath) async {
  await Future.wait(map.entries.map((e) => _writeEntryInternal(e, dirPath)));
}

Future<void> _writeEntryInternal(
    MapEntry<String, dynamic> entry, String dirPath) async {
  var entryPath = p.join(dirPath, entry.key);
  var value = entry.value;
  if (value is String) {
    await File(entryPath).writeAsBytes(hex.decode(value));
  } else if (value is Map) {
    await Directory(entryPath).create(recursive: true);
    await _writeMapInternal(value.cast(), entryPath);
  }
}
