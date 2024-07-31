import 'package:blcoc_min/services/bloc/bloc_event.dart';
import 'package:blcoc_min/services/bloc/bloc_state.dart';
import 'package:blcoc_min/services/usecases/article_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const NewsInitialState()) {
    on<NewsRequestedEvent>((event, emit) async {
      try {
        final articles = await ArticleUseCases().fetchNewsFromDataSource();
        emit(NewsLoadedState(news: articles));
      } catch (e) {
        emit(NewsErrorState(message: e.toString()));
      }
    });
  }
}