import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				title: Text("Acesso", 
        style: TextStyle(color: Colors.white))
				centerTitle: newMethod
			),
			body: _body(),
		);
	}

  bool get newMethod => true;
  _body() {
    return Center(
      child: Container(
        child: Text("Catálogo", style: TextStyle(fontSize: 20),)
      ),
    );
  }




}
