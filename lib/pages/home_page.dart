import 'package:flutter/cupertino.dart';
import 'package:sa_lr1_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                'Введите вершины в которые можно непос­редственно попасть',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.normal)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _listItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.white24,
                  title: Column(
                    children: [
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 0.1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      TextFormField(
                          initialValue: _listItems[index],
                          decoration: const InputDecoration(
                            //icon: Icon(Icons.person),
                            hintText:
                                'Введите вершины в которые можно непос­редственно попасть',

                            labelText: 'Вершины',
                          ),
                          onChanged: (value) {
                            _listItems[index] = value;
                          },
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(CupertinoIcons.clear_thick),
                    onPressed: () {
                      _removeItem(index);
                    },
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
                child: Text('Add Item'),
              ),
              ElevatedButton(
                onPressed: _saveList,
                child: Text('Save List'),
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

  void _removeItem(int index) {
    setState(() {
      _listItems.removeAt(index);
    });
  }

  void _saveList() {
    List<String> savedList = List<String>.from(_listItems);
    // Do something with the saved list
    print(savedList);
  }
}
