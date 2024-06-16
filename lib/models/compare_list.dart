import 'package:equatable/equatable.dart';

class CompareList<T> extends Equatable{
  final List<T> list;
  final String title;

  const CompareList(this.list,this.title);

  @override
  List<Object?> get props => [list,title];
}