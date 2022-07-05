import 'package:bloc/bloc.dart';
import 'package:indosiana/data/models/article_model.dart';
import 'package:indosiana/data/provider/article_provider.dart';
import 'package:meta/meta.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<FetchArticle>((event, emit) async {
      emit(ArticleLoading());
      try {
        final articles = await ArticleProvider.getArticle();
        emit(ArticleLoaded(articles: articles));
      } catch (e) {
        emit(ArticleError(e.toString()));
      }
    });
    on<FetchArticleDetail>((event, emit) async {
      emit(ArticleLoading());
      try {
        final article = await ArticleProvider.getArticleDetail(event.id);
        emit(ArticleLoaded(article: article));
      } catch (e) {
        emit(ArticleError(e.toString()));
      }
    });
  }
}
