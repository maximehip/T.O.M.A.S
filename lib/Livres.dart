import 'package:flutter/material.dart';
import 'package:tomas/LivreData.dart';

final List<LivreData> books = [
  LivreData('La panthère des neiges', 'Sylvin Tesson',
      '18€', 'images/livres/corel.jpg', 3.9, 176),
  LivreData('Astérix - Tome 38 : La Fille de Vercingétorix', 'Jean-Yves Ferri, Albert Uderzo, Didier Conrad', '9,99€',
      'images/livres/drafter.jpg', 4.5, 40),
  LivreData('Vivre avec la terre - Méthode de la ferme du Bec Hellouin', 'Charles Hervé-Gruyer, Perrine Hervé-Gruyer',
      '79€', 'res/indesign.jpg', 4.0, 1048),
  LivreData('Une année pour tout changer', 'Céline Alvarez', '18.90€',
      'res/max_3d.jpeg', 3.0, 450),
  LivreData('Millénium - Tome 6 : La fille qui devait mourir', 'David Lagercrantz, Esther Sermage',
      '23 €', 'res/maya.jpeg', 4.8, 336),
  LivreData('Notre histoire en couleurs', 'Xavier Mauduit',
      '29.90 €', 'res/photoshop.jpg', 4.5, 240),
  LivreData('Le dico 2 Laurent Baffie', 'Laurent Baffie',
      '15.90 €', 'res/premier.jpg', 4.8, 286),
  LivreData('Mattéo - Tome 5 : Cinquième époque, Octobre 1936-Septembre 1939', 'Jean-Pierre Gibrat, Jean-Pierre Gibrat',
      '17 €', 'res/sketchup.jpeg', 4.5, 321),
  LivreData('Sérotonine', 'Michel Houellebecq',
      '22 €', 'res/webmaster.jpeg', 3.5, 352),
];

class Livres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    createTile(LivreData book) => Hero(
      tag: book.title,
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Image(
            image: AssetImage(book.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Tomas"),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverGrid.count(
              childAspectRatio: 2 / 3,
              crossAxisCount: 3,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              children: books.map((book) => createTile(book)).toList(),
            ),
          )
        ],
      ),
    );
  }
}