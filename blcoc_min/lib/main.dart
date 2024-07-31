import 'package:blcoc_min/services/bloc/bloc_bloc.dart';
import 'package:blcoc_min/services/provider/theme_services.dart';
import 'package:blcoc_min/themes/theme_style.dart';
import 'package:blcoc_min/widgets/newswrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(),
      child: ChangeNotifierProvider(
        create: (context) => ThemeServiceProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(
      builder: (context, themeService, child) {
        return MaterialApp(
          home: const NewsWrapper(),
          debugShowCheckedModeBanner: false,
          themeMode: themeService.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
        );
      },
    );
  }
}
