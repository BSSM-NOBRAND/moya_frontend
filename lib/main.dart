import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/presentation/base_navigation.dart';
import 'package:moya/presentation/provider/fund_state_provider.dart';
import 'package:moya/presentation/provider/my_wishlist_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FundStateProvider>(
          create: (_) => FundStateProvider(),
        ),
        ChangeNotifierProvider<MyWishlistProvider>(
          create: (_) => MyWishlistProvider(),
        )
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
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'WantedSans',
        scaffoldBackgroundColor: Palette.white,
      ),
      home: const BaseNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}
