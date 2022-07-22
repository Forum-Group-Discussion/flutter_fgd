part of 'capt_cubit.dart';

class DataState extends Equatable {
  final List<CThread> listThread;
  const DataState({required this.listThread});

  @override
  List<Object> get props => [listThread];
}
