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
                return ListTile(
                  leading: Text(index.toString(),
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal)),
                  title: TextFormField(
                    decoration: InputDecoration(
                      //icon: Icon(Icons.person),
                      hintText: 'Куда можно попасть',
                      filled: true,
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.greenAccent),
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
                        color: Colors.black87,
                        fontWeight: FontWeight.normal),
                  ),
                  trailing: IconButton(
                    icon: const Icon(CupertinoIcons.clear_thick),
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
