import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../repo/api_client.dart';
import '../repo/search_result_model.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiInitial());
  final List<SearchResult> res = [];
  Future<void> callApi() async {
    emit(ApiLoading());
    try {
      APIClient().downloadAndParseJson().then((value) {
        res.clear();
        res.addAll(value);
        emit(ApiSuccess());
      });
    } catch (e) {
      emit(ApiFailed());
    }
  }
}
