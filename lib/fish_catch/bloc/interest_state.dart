
import 'package:kot/fish_catch/model/interst_model.dart';

abstract class InterestState {}


class InterestInitialState extends InterestState {
  @override
  List<Object?> get props => [];
}

class InterestLoadingState extends InterestState {
  @override
  List<Object?> get props => [];
}

class InterestLoadedState extends InterestState {
  final List<InterestDatum> datum;
  InterestLoadedState(this.datum);
  @override
  List<Object?> get props => [datum];
}

class InterestErrorState extends InterestState {
  String? interestMsgError;
  InterestErrorState(this.interestMsgError);
  @override
  List<Object?> get props => [interestMsgError];
}
