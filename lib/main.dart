import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Provider/PostProvider.dart';
import 'package:untitled/Provider/QuoteProvider.dart';
import 'package:untitled/Provider/UserProvider.dart';
import 'package:untitled/Views/UserProfile.dart';

import 'Provider/AuthProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => QuotesProvider()),
        ChangeNotifierProvider(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: UserProfileScreen(userId: 1),
    );
  }
}

