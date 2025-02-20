import 'package:flutter/material.dart';
import 'package:news_app_c13/api/ApiManager.dart';
import 'package:news_app_c13/data/models/sourceResponse/Source.dart';

class HomeViewModel extends ChangeNotifier{// provider

  HomeScreenState state = HomeScreenState(
    isLoading: true,
    isError: false,
    errorMessage: null,
    sourcesList: null,
  );

  void getNewsSources(String category)async{

  _emitState(state.copyWith(isLoading: true));
    try{
      var response = await ApiManager.getInstance()
          .getNewsSources(category);
      if(response?.status == 'error'){
        _emitState(state.copyWith(
          isLoading: false,
          isError: true,
          sourcesList: null,
          errorMessage: response?.message,// from server
        ));
      }else{
        _emitState(state.copyWith(
          sourcesList: response?.sources,
          isLoading: false,
          isError: false,
        ));
      }
    }on Exception catch(e){
      _emitState(state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: e.toString(),
      ));
    }

    // show loading,
    // call api
    // hideLoading
    // incase of error show error
    // incase of success show Sources
  }

  void _emitState(HomeScreenState newState){
    state = newState;
    notifyListeners();
  }
}
class HomeScreenState{
  bool isLoading = false;
  bool isError = false;
  String? errorMessage;
  List<Source>? sourcesList;

  HomeScreenState({
    required this.isLoading,
    required this.isError,
    required this.errorMessage,
    required this.sourcesList,});

  HomeScreenState copyWith({
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    List<Source>? sourcesList,
  }){
    return HomeScreenState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      sourcesList: sourcesList ?? this.sourcesList
    );
  }

}