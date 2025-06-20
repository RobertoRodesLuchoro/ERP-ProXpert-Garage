import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:provider/provider.dart';
import 'package:proxpert_garage_frontend/screens/components/header.dart';
import 'package:proxpert_garage_frontend/screens/formularioIniciarSesionScreen.dart';
import 'package:proxpert_garage_frontend/screens/mainScreen.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart' as date_locale;

import 'constants.dart';
import 'controllers/menu_app_controller.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await date_locale.initializeDateFormatting('es_ES');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MenuAppController()),
      // otros providers si tienes
    ],
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Admin Panel',
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme)
                .apply(bodyColor: Colors.black),
            canvasColor: Colors.grey[100],
          ),
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColor,
            textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: secondaryColor,
          ),
          themeMode: currentMode,
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => MenuAppController(),
              ),
            ],
            child: formularioIniciarSesion(),
          ),
        );
      },
    );
  }
}

