part of 'article_bloc.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<ArticleModel>? articles;
  final ArticleModel? article;

  ArticleLoaded({this.articles, this.article});
}

class ArticleError extends ArticleState {
  final String error;

  ArticleError(this.error);
}
