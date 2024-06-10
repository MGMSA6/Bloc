import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key});

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Equqal"),
      ),
      body: Center(
        child: Text(""),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Person person = Person(name: "Anand", age: 29);
          Person person1 = Person(name: "Anan", age: 29);

          print(person == person1);

          print(person == person);
        },
      ),
    );
  }
}


class Person extends Equatable {

  final String name;
  final int age;

  const Person({required this.name, required this.age});

  @override
  // TODO: implement props
  List<Object?> get props => [name, age];

}