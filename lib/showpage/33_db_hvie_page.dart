import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

@HiveType(typeId: 10)
class Person extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  List<String> friends;

  @override
  String toString() {
    return 'Person{name: $name, age: $age, friends: $friends}';
  }
}

//@HiveType(typeId: 2)
//class Student extends HiveObject{
//  @HiveField(0)
//  String name;
//}

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final typeId = 1;

  @override
  Person read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person()
      ..name = fields[0] as String
      ..age = fields[1] as int
      ..friends = (fields[2] as List)?.cast<String>();
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.friends);
  }
}

class P33DbHive extends StatefulWidget {
  @override
  _P33DbHiveState createState() => _P33DbHiveState();
}

class _P33DbHiveState extends State<P33DbHive> {
  String text = 'kong';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _db();
  }

  Box<Person> allPersonBox;

  void _db() async {
//    Directory tempDir = await getApplicationDocumentsDirectory();
//    String tempPath = tempDir.path;
    await Hive.initFlutter('myDb');
    Hive.registerAdapter(PersonAdapter());

    allPersonBox = await Hive.openBox<Person>('allPerson');
  }

  @override
  Widget build(BuildContext context) {
    getApplicationDocumentsDirectory().then((value) => print('path = $value'));

    return Scaffold(
      appBar: AppBar(
        title: Text('db'),
      ),
      body: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(text),
            FlatButton(
              child: Text('存数据_基本类型'),
              onPressed: () async {
                var box = await Hive.openBox('dog');
                box.put('name', 'jim');
                print(box.get('name'));
                box.close();
              },
            ),
            FlatButton(
              child: Text('存数据_定义类'),
              onPressed: () async {
//                var box = allPersonBox;

                Box<Person> box = await Hive.openBox<Person>('allPerson');

                var person = Person()
                  ..name = 'Dave'
                  ..age = 22;
                box.put('person', person);

                print(box.get('person')); // Dave - 2

                person.age = 30;
                person.save();
                print(box.get('person')); // Dave - 2
              },
            ),
            FlatButton(
              child: Text('取数据'),
              onPressed: () async {
//                var person = allPersonBox.get('person');
//                print(allPersonBox.get('person')); // Dave - 2
//                person.age = 40;
//                person.save();
//                print(allPersonBox.get('person')); // Dave - 2

                Box<Person> box1 = await Hive.openBox<Person>('allPerson');

                print(box1.get('person'));
                Person person1 = box1.get('person');

                person1.age = 41;
                person1.save();

                Box box2 = await Hive.openBox<Person>('allPerson');
                print(box2.get('person'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
