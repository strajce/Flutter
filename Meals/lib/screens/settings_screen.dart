import 'package:flutter/material.dart';

import '../items/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  final Function _savedFilterStates;
  final Map<String, bool> _currentFilter;

  SettingsScreen(this._currentFilter, this._savedFilterStates);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _gluternFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState() {
    _gluternFree = widget._currentFilter['gluten'];
    _lactoseFree = widget._currentFilter['lactose'];
    _vegan = widget._currentFilter['vegan'];
    _vegetarian = widget._currentFilter['vegetarian'];
    super.initState();
  }

  Widget buildFilterOpetions(String _title, String _description,
      bool _currentValue, Function _updateValue) {
    return SwitchListTile(
        title: Text(_title),
        value: _currentValue,
        subtitle: Text(_description),
        onChanged: _updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _gluternFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget._savedFilterStates(selectedFilters);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: MainDrawer('Settings'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            alignment: Alignment.centerLeft,
            child: Text('Filter :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
          ),
          Divider(),
          Expanded(
              child: ListView(
            children: <Widget>[
              buildFilterOpetions(
                  'Gluten free', 'Only include gluten free meals', _gluternFree,
                  (newValue) {
                setState(() {
                  _gluternFree = newValue;
                });
              }),
              buildFilterOpetions('Lactose free',
                  'Only include lactose free meals', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              buildFilterOpetions('Vegan', 'Only include vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
              buildFilterOpetions(
                  'Vegetarians', 'Only include vegetarian meals', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
