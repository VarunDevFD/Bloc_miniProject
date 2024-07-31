import 'package:blcoc_min/pages/news_detail_page.dart';
import 'package:blcoc_min/services/bloc/bloc_bloc.dart';
import 'package:blcoc_min/services/bloc/bloc_state.dart';
import 'package:blcoc_min/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBodyHome extends StatelessWidget {
  const CustomBodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Breaking News",
            style: MyTextStyles.breakNews,
          ),
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsInitialState) {
                  return const Text("");
                } else if (state is NewsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                } else if (state is NewsLoadedState) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      thickness: 1,
                      color: Colors.black
                          .withOpacity(BorderSide.strokeAlignCenter),
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: state.news.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailPage(
                                news: state.news[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                state.news[index].urlToImage != null
                                    ? Image.network(
                                        state.news[index].urlToImage!,
                                        height: 250,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset('assets/error_image.jpg',
                                        height: 250,
                                        width: double.infinity,
                                        fit: BoxFit.cover),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    state.news[index].title.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    state.news[index].description.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is NewsErrorState) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return const Text(
                  "Some Error Occurred",
                  style: TextStyle(color: Colors.red),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
