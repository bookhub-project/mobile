import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;   //metodo para o icone
  final String text;       //metodo para o texto
final Widget page;

  DrawerTile(this.icon, this.text, this.page); //quando for criado o drawer tile passara um icone e um texto
  @override
  Widget build(BuildContext context) {
    return Material(                            //criando material  para um efeito visual
      color: Colors.transparent,
      child: InkWell(
        child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
          );
    },
    child: Container(
          padding: EdgeInsets.only(top: 0,left: 0, right: 30,), //defindo margem
          height: 60.0, //altura do container
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32.0,
                color: Colors.white,
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16.0,color: Colors.white),
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}