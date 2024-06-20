import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/presentation/base_navigation.dart';
import 'package:moya/presentation/provider/fund_state_provider.dart';
import 'package:moya/presentation/provider/my_friend_list_provider.dart';
import 'package:moya/presentation/provider/my_info_provider.dart';
import 'package:moya/presentation/provider/my_wishlist_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppLinks appLinks = AppLinks();

  appLinks.uriLinkStream.listen((Uri? uri) {
    print("uri: $uri");
  }, onError: (Object err) {
    print("err: $err");
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FundStateProvider>(
          create: (_) => FundStateProvider(),
        ),
        ChangeNotifierProvider<MyWishlistProvider>(
          create: (_) => MyWishlistProvider(),
        ),
        ChangeNotifierProvider<MyFriendListProvider>(
          create: (_) => MyFriendListProvider(),
        ),
        ChangeNotifierProvider<MyInfoProvider>(
          create: (_) => MyInfoProvider(),
        ),
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
