import 'package:app_loader_search_bar/person.dart';
import 'package:flutter/material.dart';
import 'package:loader_search_bar/loader_search_bar.dart';

class LoaderSearchBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: SearchBar(

        iconified: true,

        searchItem: SearchItem.action(
          builder: (_) => Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          gravity: SearchItemGravity.end,
        ),

        defaultBar: _appBar(),

        searchHint: 'Search persons...',
        onQueryChanged: (String value){
          print(value);
        },

        onQuerySubmitted: (String value){
          print(value);
        },
        loader: QuerySetLoader<Person>(

          querySetCall: Person.filterPersonsByQuery,

          itemBuilder: Person.buildPersonRow,

          loadOnEachChange: true,
          animateChanges: false,
        ),
      ),

      body: _body(),

    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text('Loader SearchBar'),
    );
  }

  _body() {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Loader SearchBar",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

















  /*searchItem: SearchItem.menu(
    builder: (_) => PopupMenuItem(
      child: Text("Search  🔍"),
      value: "search",
    ),
  ),*/
































  _body1() {
    return Container(
      color: Colors.black12,
      child: Center(
        child: _listView(Person.persons),
      ),
    );
  }

  _listView(List<Person> listPersons) {
    return ListView.builder(
      itemCount: listPersons.length,
      itemBuilder: (context, index) {
        return _itemList(context, listPersons[index]);
      },
    );
  }

  _itemList(BuildContext context, Person person) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                person.name,
                style: TextStyle(fontSize: 15),
              ),
              subtitle: Text(
                person.address,
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                print("${person.name}");
              },
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
