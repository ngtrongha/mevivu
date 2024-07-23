import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mevivu/utils/extensions/string_extension.dart';

import 'routers/my_observer.dart';
import 'utils/loading.dart';
import 'utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.white, // status bar color
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Utils.appRouter.config(
        placeholder: (context) => const LoadingWidget(),
        navigatorObservers: () => [MyObserver()],
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.raleway().fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: '0a8ed9'.toColor,
        colorScheme: ColorScheme.fromSeed(
            seedColor: '959E5E'.toColor,
            onPrimary: '0a8ed9'.toColor,
            onPrimaryContainer: 'E9EBD5'.toColor,
            onSecondary: '9CD3EB'.toColor,
            onTertiary: '476704'.toColor,
            outline: 'BABABA'.toColor,
            onError: 'C8102E'.toColor),
        useMaterial3: false,
      ),
    );
  }
}
