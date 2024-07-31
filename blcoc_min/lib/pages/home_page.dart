import 'package:blcoc_min/services/bloc/bloc_bloc.dart';
import 'package:blcoc_min/services/bloc/bloc_event.dart';
import 'package:blcoc_min/services/provider/theme_services.dart';
import 'package:blcoc_min/widgets/custom_appbar.dart';
import 'package:blcoc_min/widgets/custom_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final newsBloc = NewsBloc();
        newsBloc.add(NewsRequestedEvent());
        return newsBloc;
      },
      child: Consumer<ThemeServiceProvider>(
        builder: (context, themeProvider, child) {
          return const Scaffold(
            appBar: CustomAppBar(),
            body: CustomBodyHome(),
          );
        },
      ),
    );
  }
}
