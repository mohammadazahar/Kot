

import '../../model/fish_model.dart';

abstract class AddFishCatchState {}


class AddFishCatchInitial extends AddFishCatchState {
  @override
  List<Object?> get props => [];
}

class AddFishCatchLoadingState extends AddFishCatchState {
  @override
  List<Object?> get props => [];
}

class AddFishCatchLoadedState extends AddFishCatchState {
  final FishCatchData datum;
  AddFishCatchLoadedState(this.datum);
  @override
  List<Object?> get props => [datum];
}

class AddFishCatchErrorState extends AddFishCatchState {
  String? addFishCatchMsgError;
  AddFishCatchErrorState(this.addFishCatchMsgError);
  @override
  List<Object?> get props => [addFishCatchMsgError];
}
