



import 'package:equatable/equatable.dart';
import 'package:kot/profiles/data/model/profile_model.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitialState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoadingState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoadedState extends ProfileState {
  final ProfileData datum;
  ProfileLoadedState(this.datum);
  @override
  List<Object?> get props => [datum];
}

class ProfileErrorState extends ProfileState {
  String? msgError;
  ProfileErrorState(this.msgError);
  @override
  List<Object?> get props => [msgError];
}
