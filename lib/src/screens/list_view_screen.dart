import 'dart:async';

import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  ListViewScreen({Key key}) : super(key: key);

  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<int> _numeros = [];
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int _ultimoItem = 1;

  @override
  void initState() {
    _agregarItems(10);
    super.initState();
    _scrollController.addListener(_addItemsWhenMaxScroll);
  }

  @override
  dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  _addItemsWhenMaxScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchData();
    }
  }

  void _fetchData() {
    _isLoading = true;
    setState(() {});
    Timer(Duration(milliseconds: 3000), respuestaHttp);
  }

  void respuestaHttp() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
    _agregarItems(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List views')),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoding(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numeros.length,
        itemBuilder: (context, index) {
          final url = 'https://picsum.photos/500/300/?image=${_numeros[index]}';
          return FadeInImage(
            image: NetworkImage(url),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
          );
        },
      ),
    );
  }

  Future<void> obtenerPagina1() async {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      _numeros.clear();
      _agregarItems(10);
    });
    return Future.delayed(duration);
  }

  void _agregarItems(int numItems) {
    for (int i = 1; i <= numItems; i++) {
      _numeros.add(_ultimoItem++);
    }
    setState(() {});
  }

  _crearLoding() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 16.0),
        ],
      );
    } else {
      return Container();
    }
  }
}
