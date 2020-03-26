
import 'package:meta/dart2js.dart';
import 'package:catapp/pokemon.dart';
import 'package:flutter/material.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
    children: <Widget>[


        Positioned(
          height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width-20,
          left: 10.0,
          top:  MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      ),
          child: Column(
            children: <Widget>[

              SizedBox(
                  height: 150.0
              ),

              Text(pokemon.name, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
              Text("Height: ${pokemon.height}"),
              Text("Weight: ${pokemon.weight}"),
              Text("Types"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.type.map((t) =>
                    FilterChip(
                        backgroundColor: Colors.green,
                        label: Text(t),
                  onSelected: (b){})).toList(),
              )
            ],
          ),
       ),
        ),
  Align(
    alignment: Alignment.topCenter,
    child: Hero(tag: pokemon.img, child: Container(
      height: 200.0,
        width: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: NetworkImage(pokemon.img))
      ),
    ))
  )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.teal,
        title: Text(pokemon.name),

    ),
     body: bodyWidget(context),
    );
  }
}
