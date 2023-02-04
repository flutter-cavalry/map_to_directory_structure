import 'package:directory_structure_map/directory_structure_map.dart';
import 'package:map_to_directory_structure/map_to_directory_structure.dart';
import 'package:test/test.dart';
import 'package:tmp_path/tmp_path.dart';

void main() {
  test('Directory to map', () async {
    var tmpDir = tmpPath();
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
    expect(await directoryToMap(tmpDir), map);
  });
}
