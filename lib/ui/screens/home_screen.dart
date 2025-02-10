import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app_c13/core/models/category.dart';
import 'package:news_app_c13/core/models/news_model.dart';
import 'package:news_app_c13/core/models/news_source.dart';
import 'package:news_app_c13/ui/widgets/news_item.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late CategoryModel _category;
  late TabController _tabController;

  // Map to store futures for each news source
  final Map<int, Future<List<NewsArticle>>> _newsSourceFutures = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: NewsSource.sourcesList.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: buildTabs(),
              onTap: (index) {
                // Trigger fetching news when tab is tapped
                setState(() {
                  _newsSourceFutures[index] =
                      fetchNewsForSource(sourceIndex: index);
                });
              },
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: List.generate(NewsSource.sourcesList.length, (index) {
              return FutureBuilder<List<NewsArticle>>(
                future: _newsSourceFutures[index],
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No news available'));
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, articleIndex) {
                      return NewsItem(article: snapshot.data![articleIndex]);
                    },
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }

  List<Tab> buildTabs() {
    return NewsSource.sourcesList
        .map((source) => Tab(
              child: Text(
                source.name,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ))
        .toList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get the category passed from previous screen
    _category = ModalRoute.of(context)!.settings.arguments as CategoryModel;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<List<NewsArticle>> fetchNewsForSource({int sourceIndex = 0}) async {
    await Future.delayed(const Duration(seconds: 1));
    int randomCount = Random().nextInt(NewsArticle.dummyNews.length) + 1;
    return NewsArticle.dummyNews.sublist(0, randomCount);
  }

  @override
  void initState() {
    super.initState();

    // Initialize TabController
    _tabController =
        TabController(length: NewsSource.sourcesList.length, vsync: this);

    // Add listener to fetch news when tab changes
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        // Fetch news for the current tab
        _fetchNewsForCurrentTab();
      }
    });

    // Fetch initial news for the first tab
    _fetchNewsForCurrentTab();
  }

  void _fetchNewsForCurrentTab() {
    // Check if we already have a future for this source
    if (!_newsSourceFutures.containsKey(_tabController.index)) {
      // If not, create a new future
      setState(() {
        _newsSourceFutures[_tabController.index] =
            fetchNewsForSource(sourceIndex: _tabController.index);
      });
    }
  }
}
