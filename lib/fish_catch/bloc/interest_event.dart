

import 'package:equatable/equatable.dart';

abstract class InterestEvent extends Equatable {}

class FetchInterestEvent extends InterestEvent {
  final String? id;
  final String? image;
  final String? name;

  FetchInterestEvent(this.id, this.image, this.name);

  @override
  List<Object> get props => [];
}
