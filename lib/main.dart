import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lxserv/routes.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const primaryColor = Colors.orange;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LxServidores',
      theme: ThemeData(primarySwatch: MyApp.primaryColor),
      initialRoute: '/companiesTable',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
