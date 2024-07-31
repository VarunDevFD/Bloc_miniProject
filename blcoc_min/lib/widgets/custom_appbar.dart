import 'package:blcoc_min/services/bloc/bloc_bloc.dart';
import 'package:blcoc_min/services/bloc/bloc_event.dart';
import 'package:blcoc_min/pages/detail_page.dart';
import 'package:blcoc_min/services/provider/theme_services.dart';
import 'package:blcoc_min/themes/colors.dart';
import 'package:blcoc_min/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(
      builder: (context, themeProvider, child) {
        return AppBar(
          toolbarHeight: preferredSize.height,
          backgroundColor: Colors.transparent,
          title: GestureDetector(
            onTap: () {
              BlocProvider.of<NewsBloc>(context).add(NewsRequestedEvent());
            },
            child: const TitleContainer(),
          ),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                BlocProvider.of<NewsBloc>(context).add(NewsRequestedEvent());
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.green,
                size: 30,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  const NewsPostDetailPage(),
                ));
              },
              child: const Text(
                "Post",
                style: TextStyle(color: Colors.green, fontSize: 25),
              ),
            ),
            IconButton(
              icon: Icon(
                themeProvider.getThemeIcon(),
                color: black,
                size: 30,
              ),
              onPressed: () {
                themeProvider.toggleTheme();
              },
            ),
          ],
        );
      },
    );
  }
}

class TitleContainer extends StatelessWidget {
  const TitleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NEWS',
              style: MyTextStyles.headingStyle,
            ),
            const SizedBox(width: 5),
            Text(
              'BLoC',
              style: MyTextStyles.headinglightStyle,
            ),
          ],
        ),
      ),
    );
  }
}
