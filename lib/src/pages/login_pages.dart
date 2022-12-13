import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromARGB(255, 47, 0, 255),
        Color.fromARGB(255, 47, 0, 255),
      ])),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,
        Container(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            children: const <Widget>[
              Icon(
                Icons.accessibility_new,
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'Formulario de Ingreso',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    // final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 220.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: const EdgeInsets.symmetric(
              vertical: 30.0,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 50.0,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0,
                  )
                ]),
            child: Column(
              children: <Widget>[
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                _crearEmail(),
                const SizedBox(
                  height: 30.0,
                ),
                _crearPassword(),
                const SizedBox(
                  height: 30.0,
                ),
                // _crearBotton(bloc),
              ],
            ),
          ),
          const Text("Olvido la Contraseña?"),
          const SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }

  Widget _crearEmail() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email),
              hintText: "Ejemplo@correo.com",
              labelText: "Correo",
            ),
          ),
        );
      },
    );
  }

  Widget _crearPassword() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: "Password",
            ),
          ),
        );
      },
    );
  }
}
