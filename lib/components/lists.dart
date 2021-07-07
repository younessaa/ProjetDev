
import 'classElement.dart';
import 'dataLists.dart';

List<Produit> listProduitsPromo = imgListPromos.map((item) =>  Produit(
    prodImage: item, 
    prodNombre: 1, 
    prodPrix: listPromoPrix[imgListPromos.indexOf(item)], 
    prodTitle: listPromosName[imgListPromos.indexOf(item)],
    lastPrix: listPromolastPrix[imgListPromos.indexOf(item)],
    prodDescription: listPromosDesc[imgListPromos.indexOf(item)],
    prodText: listPromosText[imgListPromos.indexOf(item)],
    )
  ).toList();

  List <Blog> blogList = [
  Blog(
    blogTitle: 'Les Bienfaits de La Nature sur Notre Santé',
    blogDescription: 'Arbres, Fleurs, Soleil, nous entourent au quotidien mais nous n’imaginons pas à quel point ils jouent un rôle dans notre vie. Humeur, comportement, émotions, dépendent réellement de la présence de la nature. Des études précisent cette relation et ses conditions (ce qu’on appelle la psychologie de l’environnement). Car oui, bien-être, santé et nature sont liés. La marche à pied, c’est bon pour la santé, comme on l’entend dire fréquemment. Oui, il est bon de pratiquer régulièrement de l’exercice physique, même modéré. Cependant, si l’on en croit la recherche, on peut optimiser l’efficacité de cette simple activité si on la pratique en milieu naturel. Pourquoi la nature nous fait du bien : les bienfaits des plantes vertes au travail, les émotions liées aux fleurs, les effets du soleil sur notre humeur et nos comportements...',
    blogImage: "assets/images/blog1.jpeg",
    blogMediaLink: 'https://youtu.be/lV9jzFSYxU4',
    blogTime: '5 \nFÉV 2018'
  ),
  Blog(
    blogTitle: 'Célébration de la Journée Mondiale de La Lutte contre le Cancer',
    blogDescription: 'A l’occasion de la journée mondiale de la lutte contre le cancer, Arije Phyto a célébré cet événement. C’était une occasion pour inciter les gens à revenir à tout ce qui est naturel et minimiser la consommation des produits contenant des ingrédients chimiques.',
    blogImage: "assets/images/blog2.jpg",
    blogMediaLink: null,
    blogTime: '5 \nFÉV 2018'
  )
];