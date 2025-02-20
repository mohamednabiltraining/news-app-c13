import 'package:flutter/material.dart';
import 'package:news_app_c13/api/ApiManager.dart';
import 'package:news_app_c13/data/models/sourceResponse/Source.dart';
import 'package:news_app_c13/ui/screens/news/news_view_model.dart';
import 'package:news_app_c13/ui/widgets/LoadingWidget.dart';
import 'package:news_app_c13/ui/widgets/news_list_view.dart';
import 'package:provider/provider.dart';

class Newssourcesview extends StatefulWidget {
  List<Source> sources;
  Newssourcesview(this.sources, {super.key});

  @override
  State<Newssourcesview> createState() => _NewssourcesviewState();
}

class _NewssourcesviewState extends State<Newssourcesview> {

  @override
  void initState() {
    super.initState();
    viewModel.getNews(widget.sources[selectedIndex].id ??"");
  }
  var selectedIndex = 0;

  var viewModel = NewsViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabs: buildTabs(widget.sources),
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                  viewModel.getNews(widget.sources[index].id ??"");
                });
                // Trigger fetching news when tab is tapped
              },
            ),
            Consumer<NewsViewModel>(
              builder: (context, vm, child) {
                var state = vm.state;
                Widget stateWidget = Container();
                if(state.isLoading){
                   stateWidget = LoadingWidget();
                }else if(state.isError){
                  stateWidget= Center(child: Text(state.errorMessage ?? "something went wrong"),);
                }else if(state.articlesList != null){
                  stateWidget =  Expanded(child: NewsListView(articles: state.articlesList ?? []));
                }
                return Expanded(
                  child: Column(
                    children: [
                      child!,
                      stateWidget
                    ],
                  ),
                );
              },
              child: const Text("Powerd by Route"),
            )

          ],
        ),
      ),
    );
  }

  List<Tab> buildTabs(List<Source> sources) {
    return sources
        .map((source) => Tab(
              child: Text(
                source.name ?? "",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ))
        .toList();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
