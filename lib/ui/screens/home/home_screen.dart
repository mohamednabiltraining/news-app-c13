
import 'package:flutter/material.dart';
import 'package:news_app_c13/api/ApiManager.dart';
import 'package:news_app_c13/data/models/category.dart';
import 'package:news_app_c13/ui/screens/home/home_view_model.dart';
import 'package:news_app_c13/ui/screens/news/NewsSourcesView.dart';
import 'package:news_app_c13/ui/widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late CategoryModel _category;

  var homeViewModel = HomeViewModel();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
          appBar: AppBar(
            title: Text(_category.name),
          ),
          body: Consumer<HomeViewModel>(
            builder: (context, viewModel, child) {
              var state = viewModel.state;
              if(state.isLoading){
                return LoadingWidget();
              }else if(state.isError){
                return Center(child: Text(state.errorMessage ?? "something went wrong"),);
              }else if(state.sourcesList != null){
                return Newssourcesview(state.sourcesList ?? []);
              } else{
                return Placeholder();
              }
            },
            child: null,//incase you have static component that should
            // not be rebuild
          )
          ),
    );
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _category = ModalRoute.of(context)!.settings.arguments as CategoryModel;
    homeViewModel.getNewsSources(_category.id);
  }
}
