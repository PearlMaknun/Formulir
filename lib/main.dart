import 'package:flutter/material.dart';

/**
 * Author: Lu'lu' Al-Maknun
 * Course Sources: https://www.youtube.com/watch?v=ULSPXpVoogg
 */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Formulir'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  TextEditingController _controllerNama = new TextEditingController();
  TextEditingController _controllerPassword = new TextEditingController();
  TextEditingController _controllerMotto = new TextEditingController();

  String _jk = "Laki-laki";
  String _agama = "Islam";

  List<String> _listagama = [
    "Islam",
    "Kristen Katolik",
    "Kristen Protestan",
    "Hindu",
    "Budha"
  ];

  void _pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  void _pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  void _kirimData(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text("Nama Lengkap: ${_controllerNama.text}"),
            new Text("Password: ${_controllerPassword.text}"),
            new Text("Motto Hidup ${_controllerMotto.text}"),
            new Text("Jenis Kelamin: $_jk"),
            new Text("Agama: $_agama"),
            new RaisedButton(
              child: new Text("OK"),
              onPressed: ()=>Navigator.pop(context),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  controller: _controllerNama,
                  decoration: new InputDecoration(
                    hintText: "Nama Lengkap",
                    labelText: "Nama Lengkap",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextFormField(
                  controller: _controllerPassword,
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextFormField(
                  controller: _controllerMotto,
                  maxLines: 3,
                  decoration: new InputDecoration(
                    hintText: "Motto",
                    labelText: "Motto",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new RadioListTile(
                  value: "Laki-laki",
                  title: new Text("Laki-laki"),
                  groupValue: _jk,
                  onChanged: (String value) {
                    _pilihJk(value);
                  },
                  activeColor: Colors.pink,
                  subtitle: Text("Pilih ini jika anda Laki-laki."),
                ),
                new RadioListTile(
                  value: "Perempuan",
                  title: new Text("Perempuan"),
                  groupValue: _jk,
                  onChanged: (String value) {
                    _pilihJk(value);
                  },
                  activeColor: Colors.pink,
                  subtitle: Text("Pilih ini jika anda Perempuan."),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    new Text(
                      "Agama    ",
                      style: new TextStyle(fontSize: 16.0, color: Colors.pink),
                    ),
                    new DropdownButton(
                      value: _agama,
                      onChanged: (String value) {
                        _pilihAgama(value);
                      },
                      items: _listagama.map((String value) {
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                new RaisedButton(
                  child: new Text("OK"),
                  color: Colors.pink,
                  onPressed: (){
                    _kirimData();
                  },
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
