// ignore_for_file: unused_local_variable, avoid_single_cascade_in_expression_statements, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';

part 'capt_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(const DataState(listThread: [])) {
    initialState();
  }

  void initialState() async {
    await syncDataProvider();
  }

  void tambahData(CThread contactsModel) async {
    final List<CThread> data = List.from(state.listThread)..add(contactsModel);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodeData = CThread.encode(data);
    await prefs.setString('contact_value', encodeData);
    emit(DataState(listThread: data));
  }

  Future syncDataProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String contactString = prefs.getString('contact_value')!;
    final listItem = CThread.decode(contactString);
    emit(DataState(listThread: listItem));
  }
}