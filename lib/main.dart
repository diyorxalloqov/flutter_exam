import 'package:flutter/material.dart';
import 'package:flutter_exam_/db/PhotoDBService.dart';
import 'package:flutter_exam_/provider/PhotoProvider.dart';
import 'package:flutter_exam_/ui/HomePage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  PhotoDBService.registeradapter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => PhotoProvider())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
