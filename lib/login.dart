import 'dart:html';

import 'package:flutter/material.dart';
import 'package:jarvis_assistent/Themes/themes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Modelo de banco de dados para página de login
  // late LoginPageModel _model;

  double radius = 12;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 20, 24, 0),
              child: Column(
                children: [
                  _titleCard(),
                  _emailInput(),
                  _senhaInput(),
                  _loginButtons(),
                  _createAccountButton()
                ],
              )
            )
          ],
        ),
      )
    );
  }

  Widget _titleCard() {
    return const Padding(
      padding: EdgeInsetsDirectional.fromSTEB(100, 0, 100, 0),
      child: Text(
        "Jarvis Assistant",
        style: TextStyle(fontSize: 32),
      ),
    );
  }

  Widget _emailInput() {
    return Padding( // Input de Email
      padding: const EdgeInsetsDirectional.fromSTEB(100, 20, 100, 0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontSize: 18,
          color: AppTheme.textColor,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2
        ),
        decoration: InputDecoration(
          labelText: "Email",
          labelStyle: const TextStyle(fontSize: 18),
          hintText: "Digite seu E-mail",
          hintStyle: TextStyle(color: AppTheme.textColor),
          enabledBorder: AppTheme.outlineInputBorder,
          fillColor: AppTheme.appBarColor,
          focusedBorder: AppTheme.outlineInputBorder,
          filled: true,
        ),
      )
    );
  }

  Widget _senhaInput(){
    return Padding( // Input de Senha
      padding: const EdgeInsetsDirectional.fromSTEB(100, 20, 100, 0),
      child: TextFormField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: "Senha",
          labelStyle: const TextStyle(fontSize: 18),
          hintText: "Digite sua Senha",
          hintStyle: const TextStyle(fontSize: 18),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 105, 7, 0),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(radius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 105, 7, 0),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(radius)
          )
        ),
      )
    );

  }

  Widget _loginButtons(){
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.pink),
              minimumSize: MaterialStateProperty.all<Size>(const Size(120, 50)),
            ),
            child: const Text(
              "Criar conta",
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
              foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 255, 255)),
              overlayColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) return const Color.fromARGB(255, 233, 30, 30);
                if (states.contains(MaterialState.focused) || states.contains(MaterialState.pressed)) {
                  return const Color.fromARGB(255, 243, 33, 33).withOpacity(0.12);
                }
                return Colors.pink; 
              }),
              minimumSize: MaterialStateProperty.all<Size>(const Size(120, 50)),
            ),
            child: const Text(
              "Entrar",
              style: TextStyle(fontSize: 22),
            ),
          ),
        )
      ],
    );
  }

  Widget _createAccountButton(){
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 4, 0),
          child: Text(
            "Criar conta",
            style: TextStyle(fontSize: 22),
          )
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 4, 0),
          child: Icon(Icons.arrow_forward)
        )
      ]
    );
  }
}
