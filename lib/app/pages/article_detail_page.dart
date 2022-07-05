import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:indosiana/app/bloc/article/article_bloc.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({Key? key, required this.title, required this.id}) : super(key: key);

  final String title;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocProvider<ArticleBloc>(
        create: (context) => ArticleBloc(),
        child: _Body(id: id),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      bloc: ArticleBloc()..add(FetchArticleDetail(widget.id)),
      builder: (context, state) {
        if (state is ArticleLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ArticleLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Photo
                  Image.network(state.article!.image),

                  // Detai Article
                  Text(
                    state.article!.title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    state.article!.createdAt,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),

                  Html(
                    data: state.article!.description,
                  ),
                ],
              ),
            ),
          );
        } else if (state is ArticleError) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(
            child: Text('Unknown state'),
          );
        }
      },
    );
  }
}
