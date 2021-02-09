import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10),
          _cardTipo1(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10),
          _cardTipo1(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10),
          _cardTipo1(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10),
          _cardTipo1(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Soy el título de esta tarjeta'),
            subtitle: Text(
                'Soy el subtitulo de la tarjeta que se está visualizando justo ahora'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('Ok')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    /* return Card(
      clipBehavior: Clip.antiAlias, //para que nada salga de la tarjeta
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://unravel.ink/wp-content/uploads/2020/07/shutterstock_1268023414.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover,
          ),
          /* Image(
            image: NetworkImage(
                'https://unravel.ink/wp-content/uploads/2020/07/shutterstock_1268023414.jpg'),
          ), */
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner'),
          )
        ],
      ),
    ); */
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://unravel.ink/wp-content/uploads/2020/07/shutterstock_1268023414.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner'),
          )
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 1.0,
            offset: Offset(0.0, 5.0),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
    );
  }
}
