import 'package:hive/hive.dart';

@HiveType(typeId: 12)
class Dog {
  @HiveField(10)
  String name = '';

  @override
  String toString() {
    return '$name: $name';
  }
}
