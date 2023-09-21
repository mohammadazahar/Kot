import 'package:equatable/equatable.dart';
import 'package:kot/boat_booking/data/model/booking_history.dart';

import '../../../data/model/category_model.dart';



abstract class CategoryState extends Equatable {}

class CategoryInitialState extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoadedState extends CategoryState {
  final List<CategoryDatum> datum;
  CategoryLoadedState(this.datum);
  @override
  List<Object?> get props => [datum];
}

class CategoryErrorState extends CategoryState {
  String? categoryMsgError;
  CategoryErrorState(this.categoryMsgError);
  @override
  List<Object?> get props => [categoryMsgError];
}
