import 'package:flutter/material.dart';

class Person {
  const Person(this.name, this.address);

  final String name;
  final String address;

  static const List<Person> persons = [
    Person('Derek Robertson', '8397 California St'),
    Person('Ethel Mills', '5050 Dogwood Ave'),
    Person('Aiden Cruz', '8866 W Gray St'),
    Person('Earl Ray', '3220 Central St'),
    Person('Arnold Bailey', '1809 Abby Park St'),
    Person('Evelyn Oliver', '3220 Central St'),
    Person('Wesley Byrd', '3603 W Tropical Pkwy'),
    Person('Andre Stewart', '5931 Railroad St'),
    Person('Denise Rose', '5928 Cherry St'),
    Person('Jane Morrison', '3499 Perfect Day Ave'),
  ];

  static List<Person> filterPersonsByQuery(String query) {
    return persons
        .where(
            (person) => person.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  static Widget buildPersonRow(Person person) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildPersonTile(person),
        ],
      ),
    );
  }

  static Widget _buildPersonTile(Person person) {
    return ListTile(
      onTap: () {
        print("${person.name}");
      },
      title: Text(person.name),
      subtitle: Text(person.address),
    );
  }
}
