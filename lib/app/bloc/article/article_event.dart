part of 'article_bloc.dart';

@immutable
abstract class ArticleEvent {}

class FetchArticle extends ArticleEvent {}

class FetchArticleDetail extends ArticleEvent {
  final int id;

  FetchArticleDetail(this.id);
}
