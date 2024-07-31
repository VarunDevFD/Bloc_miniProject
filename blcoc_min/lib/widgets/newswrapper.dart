import 'package:blcoc_min/services/bloc/bloc_bloc.dart';
import 'package:blcoc_min/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsWrapper extends StatelessWidget {
  const NewsWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
       child: const HomeScreen(),
    );
  }
}