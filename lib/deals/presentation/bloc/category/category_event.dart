

import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {}

class FetchCategoryEvent extends CategoryEvent {
  @override
  List<Object> get props => [];
}
