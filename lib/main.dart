
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/controller/bottombar_provider.dart';
import 'package:myapp/controller/category_provider.dart';
import 'package:myapp/controller/homepage_provider.dart';
import 'package:myapp/views/main_page.dart';
import 'package:myapp/controller/wishlist_provider.dart.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDeXMe2ILD0Zb59Qtdu-X9ZyR-tGkwR4qw', 
      appId: '1:639102444061:web:c8b2efa6a6ce8afddd9cf4', 
      messagingSenderId: '639102444061', 
      projectId: 'e-commerce-6de41'));
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>BottomBarProvider()),
        ChangeNotifierProvider(create: (context)=>Wishlist()),
        ChangeNotifierProvider(create: (context)=>HomeProvider()),
        ChangeNotifierProvider(create: (context)=>CategoryProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}