import 'package:import_lint/src/import_lint_options.dart';
import 'package:import_lint/src/paths.dart';
import 'package:test/expect.dart';
import 'package:test/test.dart';
import 'package:analyzer/source/line_info.dart' as plugin;

import '../helper/generate_test_project.dart';

void runPathsTest() {
  group('paths', () {
    test('not found path', () {
      final project = GenerateTestProject.ofImportLintOptions();
      project.generate();

      final options =
          ImportLintOptions.init(directoryPath: project.directoryPath);
      final paths = Paths.ofDartFile(directoryPath: options.directoryPath);

      expect(paths.value.length, 0);
    });
    test('found 1', () {
      final project = GenerateTestProject.ofPackageImportDartFiles();
      project.generate();

      final options =
          ImportLintOptions.init(directoryPath: project.directoryPath);
      final paths = Paths.ofDartFile(directoryPath: options.directoryPath);

      expect(paths.value.length, 1);
    });
  });
}
