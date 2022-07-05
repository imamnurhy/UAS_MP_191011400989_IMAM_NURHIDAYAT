import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indosiana/app/bloc/article/article_bloc.dart';
import 'package:indosiana/app/pages/article_detail_page.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('191011400989_IMAM-NURHIDAYAT'),
      ),
      body: BlocProvider<ArticleBloc>(
        create: (context) => ArticleBloc(),
        child: const _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: BlocBuilder<ArticleBloc, ArticleState>(
        bloc: ArticleBloc()..add(FetchArticle()),
        builder: (context, state) {
          if (state is ArticleLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ArticleLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Title
                  const Text(
                    'Artikel Terbaru',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // List Article
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.articles!.length,
                      itemBuilder: (context, index) {
                        final article = state.articles![index];
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                              article.image,
                              width: 80.0,
                              height: 80.0,
                            ),
                            title: Text(article.title),
                            subtitle: Text(article.createdAt),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ArticleDetailPage(
                                  id: article.id,
                                  title: article.title,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
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
      ),
    );
  }
}
