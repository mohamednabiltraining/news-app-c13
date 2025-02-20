import 'package:flutter/material.dart';
import 'package:news_app_c13/api/ApiManager.dart';
import 'package:news_app_c13/data/models/newsResponse/Articles.dart';

class NewsViewModel extends ChangeNotifier{

  NewsScreenState state = NewsScreenState(
    isLoading: true,
    isError: false,
    errorMessage: null,
    articlesList: null,
  );

  void getNews(String source)async{
    _emitState(state.copyWith(isLoading: true));
    try{
      var response = await ApiManager.getInstance().getNews(source);
      if(response?.status == 'error'){
        _emitState(state.copyWith(
          isLoading: false,
          isError: true,
          articlesList: null,
            ));
      }else {
        _emitState(state.copyWith(
          isLoading: false,
          isError: false,
          articlesList: response?.articles,
        ));

      }
    }on Exception catch(e){
      _emitState(state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: e.toString(),
      ));
    }
  }

  void _emitState(NewsScreenState newState){
    state = newState;
    notifyListeners();
  }
}
class NewsScreenState{
  bool isLoading = false;
  bool isError = false;
  String? errorMessage;
  List<NewsArticle>? articlesList;

  NewsScreenState({
    required this.isLoading,
    required this.isError,
    required this.errorMessage,
    required this.articlesList,
  });

  NewsScreenState copyWith({
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    List<NewsArticle>? articlesList,
  }){
    return NewsScreenState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      articlesList: articlesList ?? this.articlesList
    );
  }
}