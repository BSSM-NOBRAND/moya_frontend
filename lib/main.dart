import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/core/utils/my_dio.dart';
import 'package:moya/core/utils/pref_util.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/presentation/add_friend/provider/friend_preview_provider.dart';
import 'package:moya/presentation/add_wishlist/provider/wishlist_item_preview_provider.dart';
import 'package:moya/presentation/base_navigation.dart';
import 'package:moya/presentation/friend/provider/friend_fund_list_provider.dart';
import 'package:moya/presentation/provider/fund_state_provider.dart';
import 'package:moya/presentation/provider/my_friend_list_provider.dart';
import 'package:moya/presentation/provider/my_info_provider.dart';
import 'package:moya/presentation/provider/my_wishlist_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefUtil.init();
  initServiceLocator();

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
        ChangeNotifierProvider<WishlistItemPreviewProvider>(
          create: (_) => WishlistItemPreviewProvider(),
        ),
        ChangeNotifierProvider<FriendFundListProvider>(
          create: (_) => FriendFundListProvider(),
        ),
        ChangeNotifierProvider<FriendPreviewProvider>(
          create: (_) => FriendPreviewProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> signIn(GoogleSignInAccount account) async {
    try {
      print(account);
      var res = await myDio.post<Map>(
        '/auth',
        data: {
          "name": account.displayName,
          "email": account.email,
          "profileImage":
              // "https://lh3.googleusercontent.com/a/ACg8ocKkH_ivB-TTaNWsbqJjNLLUJbs3mtXHB_5hlQ5NCgqEJGPaNw=s1337",
              account.photoUrl,
          "birth": "2006-05-08"
        },
      );
      Map data = res.data ?? {};
      PrefUtil.setString('accessToken', data['accessToken']);
      PrefUtil.setString('refreshToken', data['refreshToken']);
    } catch (e) {
      print(e);
    }
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    GoogleSignInAccount? account;

    if (PrefUtil.getString('accessToken').isEmpty) {
      account = await googleSignIn.signIn();
    }
    if (account != null) {
      await signIn(account);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'WantedSans',
        scaffoldBackgroundColor: Palette.white,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Palette.white,
        ),
      ),
      home: const BaseNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}
