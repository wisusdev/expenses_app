import 'package:expenses_app/pages/add_entries.dart';
import 'package:expenses_app/pages/add_expenses.dart';
import 'package:expenses_app/pages/home_page.dart';
import 'package:expenses_app/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    // Cargamos nuestro provider en lo mas alto de nuestra app
    MultiProvider(
        providers: [
            ChangeNotifierProvider(create: (context) => UIProvider())
        ],
        child: const MyApp()
    )
);

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);
    
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Material App',
            // 
            localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate
            ],
            supportedLocales: const [
                Locale('en'),
                Locale('es')
            ],
            theme: ThemeData.dark().copyWith(
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.grey[900],
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    selectedItemColor: Colors.green
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.green[800],
                    foregroundColor: Colors.white
                ),
                colorScheme: const ColorScheme.dark(
                    primary: Colors.green,
                ),
                scaffoldBackgroundColor: Colors.grey[900],
                primaryColorDark: Colors.grey[800]
            ),
            initialRoute: 'home',
            routes: {
                'home' : (context) => const HomePage(),
                'addEntries' : (context) => const AddEntries(),
                'addExpenses' :(context) => const AddExpenses(),
            },
        );
    }
}