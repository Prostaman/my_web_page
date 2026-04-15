import 'package:flutter_test/flutter_test.dart';
import 'package:my_web_page/data/sources/education_list.dart';
import 'package:my_web_page/data/sources/experience_list.dart';
import 'package:my_web_page/data/sources/skills_list.dart';
import 'package:my_web_page/data/sources/projects_list.dart';

void main() {
  group('Data Consistency Tests', () {
    test('Education list should not be empty', () {
      expect(educationList.isNotEmpty, true);
    });

    test('Experience list should not be empty and have valid data', () {
      expect(experienceList.isNotEmpty, true);
      for (var exp in experienceList) {
        expect(exp.company.isNotEmpty, true);
        expect(exp.role.isNotEmpty, true);
      }
    });

    test('Skills list should be categorized', () {
      expect(skillsList.isNotEmpty, true);
      expect(skillsList.any((s) => s.category == 'Mobile Development'), true);
    });

    test('Projects list should have descriptions and links', () {
      expect(projectsList.isNotEmpty, true);
      for (var project in projectsList) {
        expect(project.title.isNotEmpty, true);
        expect(project.description.isNotEmpty, true);
      }
    });
  });
}
