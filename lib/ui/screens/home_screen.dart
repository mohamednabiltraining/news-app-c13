import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app_c13/data/dummy_data.dart';
import 'package:news_app_c13/data/models/category.dart';
import 'package:news_app_c13/data/models/news_model.dart';

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: dummySources.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: buildTabs(),
              onTap: (index) {
                // Trigger fetching news when tab is tapped
              },
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: dummySources.map((source) {
              return Center(child: Text(source.name));
            }).toList(),
          ),
        ),
      ),
    );
  }

  List<Tab> buildTabs() {
    return dummySources
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
    
    _category = ModalRoute.of(context)!.settings.arguments as CategoryModel;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<NewsArticle> fetchNewsForSource({int sourceIndex = 0}) {
    int randomCount = Random().nextInt(dummyNews.length) + 1;
    return dummyNews.sublist(0, randomCount);
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: dummySources.length, vsync: this);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        _fetchNewsForCurrentTab();
      }
    });

    _fetchNewsForCurrentTab();
  }

  void _fetchNewsForCurrentTab() {
    setState(() {
      fetchNewsForSource(sourceIndex: _tabController.index);
    });
  }
}
