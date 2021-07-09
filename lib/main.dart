import 'package:arijephyto/admin/notifier/commandes_notifier.dart';
import 'package:arijephyto/admin/notifier/produits_notifier.dart';
import 'package:arijephyto/admin/notifier/user_notifier.dart';
import 'package:arijephyto/admin/screens/commandes.dart';
import 'package:arijephyto/admin/screens/produitsAdmin.dart';
import 'package:arijephyto/components/idClass.dart';
import 'package:arijephyto/screens/blogs/blogScreen.dart';
import 'package:arijephyto/screens/boutique/boutique.dart';
import 'package:arijephyto/screens/boutique/produit.dart';
import 'package:arijephyto/screens/categories/categorieScreen.dart';
import 'package:arijephyto/screens/categories/categories.dart';
import 'package:arijephyto/screens/contact-aProposDe/aproposde.dart';
import 'package:arijephyto/screens/contact-aProposDe/contact.dart';
import 'package:arijephyto/screens/login/login.dart';
import 'package:arijephyto/screens/panier/panier.dart';
import 'package:arijephyto/screens/portfolio/autoris%C3%A9ONSSA.dart';
import 'package:arijephyto/screens/portfolio/espritCooperative.dart';
import 'package:arijephyto/screens/portfolio/madeInMorocco.dart';
import 'package:arijephyto/screens/portfolio/portfolio.dart';
import 'package:arijephyto/screens/portfolio/proc%C3%A9d%C3%A9sArtisanaux.dart';
import 'package:arijephyto/screens/signup/compteInfo.dart';
import 'package:arijephyto/screens/signup/signup.dart';
import 'package:arijephyto/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'admin/screens/addProduit.dart';
import 'screens/blogs/blogs.dart';
import 'screens/home/homeScreen.dart';
import 'screens/passerCommande/cmiMethode.dart';
import 'screens/passerCommande/passerParCMI.dart';
import 'screens/portfolio/100Naturel.dart';
import 'screens/promo/promo.dart';
import 'theme.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProduitsNotifier()),
        ChangeNotifierProvider(create: (context) => UsersNotifier()),
        ChangeNotifierProvider(create: (context) => IdNotifier()),
        ChangeNotifierProvider(create: (context) => CommandesNotifier()),
      ],
      child: MaterialApp(
        theme: lightThemeData(context),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
        '/' : (context) =>  Welcome(),
        '/home' : (context) => Home(),
        '/boutique' : (context) => Boutique(),
        '/categories' : (context) => Categories(),
        '/panier' : (context) => Panier(),
        '/blogs' : (context) => Blogs(),
        '/portfolio' : (context) => Portfolio(),
        '/contact' : (context) => Contact(),
        '/aproposde' : (context) => AproposDe(),
        '/promo' : (context) => Promo(),
        '/produit' : (context) => ProduitItem(),
        '/blogscreen' : (context) => BlogScreen(),
        '/signup' : (context) => Signup(),
        '/login' : (context) => Login(),
        '/Procédés Artisanaux' : (context) => ProcedesArtisanaux(),
        '/Autorisé ONSSA' : (context) => AutoriseONSSA(),
        '/100% Naturel' : (context) => Naturel(),
        '/Made in Morocco' : (context) => MadeInMorocco(),
        '/Esprit Coopérative' : (context) => EspritCooperative(),
        '/categorieScreen' : (context) => CategorieScreen(),
        '/moncompte' : (context) => MonCompte(),
        '/passercommande' : (context) => PasserCommande(),
        '/cmiMethode' : (context) => CmiMethode(),
        '/produitsAdmin' : (context) => AdminScreenProduits(),
        '/addProduit' : (context) => AjouterProduit(),
        '/commandesAdmin' : (context) => Commandes(),
      },
      ),
    );
  }
}
