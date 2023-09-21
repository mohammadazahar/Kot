

import 'package:equatable/equatable.dart';

import '../../../data/model/all_deal_model.dart';

abstract class AllDealsState extends Equatable {}

class AllDealsInitialState extends AllDealsState {
  @override
  List<Object?> get props => [];
}

class AllDealsLoadingState extends AllDealsState {
  @override
  List<Object?> get props => [];
}

class AllDealsLoadedState extends AllDealsState {
  final List<AllDealDatumModel> datum;
  AllDealsLoadedState(this.datum);
  @override
  List<Object?> get props => [datum];
}

class AllDealsErrorState extends AllDealsState {
  String? msgError;
  AllDealsErrorState(this.msgError);
  @override
  List<Object?> get props => [msgError];
}
