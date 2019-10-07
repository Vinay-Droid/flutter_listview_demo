import 'package:flutter/material.dart';

void main() => runApp(

    MaterialApp(
      title: 'ListView Demo',
      home: Scaffold(
        appBar: AppBar(title: Text("List View"),),
        //body: GetListView(),
        //body: getLongListView(),
        body: GetLongListView(),
      ),
    )
);

// we can do it by method or by class

class GetListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[

        ListTile(
          leading: Icon(Icons.departure_board),
          title: Text('Delhi to Lucknow'),
          subtitle: Text('Dehli to lucknow via Muradabad'),
          trailing: Icon(Icons.ac_unit),
        ),
        ListTile(
          leading: Icon(Icons.departure_board),
          title: Text('Delhi to Mumbai'),
          subtitle: Text('Dehli to Mumbai via Jhansi'),
          trailing: Icon(Icons.ac_unit),
        )
      ],

    );
  }
}

// Generate Long Listview.class.
// For Generate Long listview, we need Datasource.
//Long Listview is memory efficient.
// For generate long list three steps are required.
//1.Create Datasource.
//2.Convert DataSource into Widgets.
//3.Use Widgets as the children of Listview.

// we can do it by method or by class
class GetLongListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var listItems = getDataList();
    return ListView.builder( // ListView.builder is very important for long listview
        itemBuilder: (contex, index){

          return ListTile(
            title: Text(listItems[index]),
            leading: Icon(Icons.departure_board),
            subtitle: Text('Dehli to Mumbai via Jhansi'),
            trailing: Icon(Icons.ac_unit),
            onTap: (){

              displayAlertDialog(context, index);
            },


          );
        });
  }

}

List<String> getDataList(){

  var items = List<String>.generate(100, (counter) => "Item$counter");
  return items;
}

Widget getLongListView(){

  var listItems = getDataList();

  var listview = ListView.builder(
      itemBuilder: (contex, index){

        return ListTile(
          title: Text(listItems[index]),
          leading: Icon(Icons.departure_board),
          subtitle: Text('Dehli to Mumbai via Jhansi'),
          trailing: Icon(Icons.ac_unit),

        );
      });

  return listview;
}

//Reference:
//https://medium.com/@nils.backe/flutter-alert-dialogs-9b0bb9b01d28
//https://material.io/components/dialogs/#anatomy
//https://api.flutter.dev/flutter/material/AlertDialog-class.html

void displayAlertDialog(BuildContext context, int index){

  showDialog(
      context: context,
      builder: (BuildContext context){

        return AlertDialog(
          title: Text("Alert Dialog Title"),
          content: Text("Alert Dialog Body. Sucessfull click on item $index"),
          actions: <Widget>[
            FlatButton(
              child: Text("CANCEL"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("OK"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
  );

}


