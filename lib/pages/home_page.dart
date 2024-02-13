import 'package:flutter/cupertino.dart';
import 'package:sa_lr1_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic List Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DynamicListPage(),
    );
  }
}

class DynamicListPage extends StatefulWidget {
  @override
  _DynamicListPageState createState() => _DynamicListPageState();
}

class _DynamicListPageState extends State<DynamicListPage> {
  List<String> _listItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Множество правых инциденций'),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
                'Введите вершины в которые можно непос­редственно попасть из этой вершины',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.normal)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _listItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 9, right: 9, bottom: 10),
                  child: ListTile(
                    tileColor: Color.fromARGB(31, 163, 162, 177),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 196, 194, 235),
                        child: Text(index.toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.normal))),
                    title: TextFormField(
                      decoration: InputDecoration(
                        //icon: Icon(Icons.person),
                        hintText: 'Куда можно попасть',
                        filled: true,
                        fillColor: const Color.fromARGB(0, 53, 22, 22),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 141, 105, 240)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                      ),
                      initialValue: _listItems[index],
                      onChanged: (value) {
                        _listItems[index] = value;
                      },
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _addItemToList,
                child: const Text('Добавить'),
              ),
              ElevatedButton(
                onPressed: _removeItem,
                child: const Text('Удалить'),
              ),
              ElevatedButton(
                onPressed: () {
                  _compute(context);
                },
                child: const Text('Перевести'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addItemToList() {
    setState(() {
      _listItems.add('');
    });
  }

  void _removeItem() {
    setState(() {
      try {
        _listItems.removeAt(_listItems.length - 1);
      } catch (e) {}
    });
  }

  List<int> stringToList(String input) {
    // Разбиваем строку на отдельные числа с помощью метода split()
    List<String> numbersAsString = input.split(' ');

    // Преобразуем каждую строку с числом в целое число с помощью метода map()
    List<int> numbers = numbersAsString.map((str) => int.parse(str)).toList();

    return numbers;
  }

  void _compute(BuildContext context) {
    try {
      _listItems.removeAt(0);

      List<String> savedList = List<String>.from(_listItems);
      print(savedList);
      List<List<int>> matrix = List.generate(
          savedList.length, (_) => List<int>.filled(savedList.length, 0));
      for (int i = 0; i < savedList.length; i++) {
        matrix[i] = stringToList(savedList[i]);
      }
      print(matrix);
    } catch (e) {}
    //Navigator.of(context).pushNamed( '/result');
  }
}
