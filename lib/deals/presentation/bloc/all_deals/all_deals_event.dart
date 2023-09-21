

import 'package:equatable/equatable.dart';

abstract class AllDealsEvent extends Equatable {}

class FetchAllDealsEvent extends AllDealsEvent {
  @override
  List<Object> get props => [];
}
