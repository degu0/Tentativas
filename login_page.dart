import 'package:first_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

	final _ctrlLogin = TextEditingController();
	final _ctrlSenha = TextEditingController();
	final _formKey = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Acesso", 
        style: TextStyle(color: Colors.white))
				centerTitle: true,
			),
			body: _body(context),
		);
	}
	
  _body(BuildContext context){
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
        padding: EdgeInsets.all(15),
          children: <Widget>[
            _testFromfield(
              "Login",
              "Digite o Login",
              controller: _ctrlLogin,
              validator: _validaLogin
            ),
            _testFromfield(
              "Senha",
              "Digite a Senha",
              controller: _ctrlSenha,
              validator: _validaSenha
            ),
            _raisedButton("Login", Colors.orange, context),
          ],
        ),
      ),
    );
  }

  _testFromfield(
    String label,
    String hint, {
    bool senha = false, TextEditingController controller, String Function(String texto) validator
    TextEditingController  controller,
    FormFieldValidator<String> validator,
    }) {
      return TextFormField(
        controller: controller,
        validator: validator,
        obscureText: senha,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
      );
    }

  String _validaLogin(String texto) {
    if(texto.isEmpty){
      return "Digite o Login";
    }
    if(texto.length<3){
      return "O campo precisa ter mais de 3 caracteres";
    }
    return null;
  }
  String _validaLogin(String texto) {
    if(texto.isEmpty){
      return "Digite o Senha";
    }
    return null;
  }
 
 _raisedButton(
   String texto,
   Color cor,
   BuildContext context) {
    return RaisedButton(
     color: cor,
     child: Text(
       texto,
       style: TextStyle(
         color: Colors.white,
         fontSize: 20,
       ),
     ),
     onPressed: () {
       _clickButton(context);
     },
    );
  }

  void _clickButton(BuildContext context) {
    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }

    String login = _ctrlLogin.text;
    String senha = _ctrlSenha as String;

    print("login : $login senha: $senha");
  
  _navegaHomePage(context);
  
  }

  _navegaHomePage(BuildContext context){
    Navigator.push(
      context, MaterialPageRoute(builder: (context)=> HomePage()),
    );
  }
}
