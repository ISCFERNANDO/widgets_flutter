import 'package:flutter/material.dart';
import 'package:multiples_widgets/src/providers/menu_provider.dart';
import 'package:multiples_widgets/src/utils/icono_string_util.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _buildList(),
    );
  }

  _buildList() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      opciones.add(
        ListTile(
          title: Text(opt['texto']),
          leading: Icon(getIcon(opt['icon']), color: Colors.blue),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            /* final route = MaterialPageRoute(
              builder: (context) => AlertScreen(),
            );
            Navigator.push(context, route); */
            Navigator.pushNamed(context, opt['ruta']);
          },
        ),
      );
    });
    return opciones;
  }
}
