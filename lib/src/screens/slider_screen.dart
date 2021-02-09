import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  SliderScreen({Key key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _valorSlider = 10;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearImagen(),
            _crearCheckBox(),
            _crearSwitch(),
          ],
        ),
      ),
    );
  }

  _crearSlider() {
    return Slider(
      label: 'Tamaño de la imágen',
      //divisions: 20,
      activeColor: Colors.indigoAccent,
      min: 10,
      max: 400,
      value: _valorSlider,
      onChanged: _isChecked
          ? null
          : (value) {
              print('value $value');
              setState(() {
                _valorSlider = value;
              });
            },
    );
  }

  _crearImagen() {
    return FadeInImage(
      image: NetworkImage(
          'https://unravel.ink/wp-content/uploads/2020/07/shutterstock_1268023414.jpg'),
      placeholder: AssetImage('assets/jar-loading.gif'),
      fadeInDuration: Duration(milliseconds: 200),
      fit: BoxFit.cover,
      width: _valorSlider,
      height: _valorSlider,
    );
  }

  _crearCheckBox() {
    /* return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bloquear slider?'),
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value;
                        });
                      },
                    ),
                  ],
                ); */

    return CheckboxListTile(
      title: Text('Bloquear slider?'),
      value: _isChecked,
      onChanged: (value) {
        setState(() {
          _isChecked = value;
        });
      },
    );
  }

  _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider?'),
      value: _isChecked,
      onChanged: (value) {
        setState(() {
          _isChecked = value;
        });
      },
    );
  }
}
