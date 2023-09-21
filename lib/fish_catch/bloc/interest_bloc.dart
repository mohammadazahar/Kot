import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kot/fish_catch/repository/interst_repo.dart';
import 'package:meta/meta.dart';

import 'interest_event.dart';
import 'interest_state.dart';

class InterestBloc
    extends Bloc<InterestEvent, InterestState> {
  final InterestRepository interestRepository = InterestRepository();
  InterestBloc(InterestRepository interestRepository) : super(InterestInitialState()) {
    on<FetchInterestEvent>((event, emit) async {
      emit(InterestLoadingState());
      try {
        final interest = await interestRepository.getCallAllInterestApi(
          id: event.id,
          image: event.image,
          name: event.name
        );
        if (interest != null) {
          emit(InterestLoadedState(interest));
        }
      } catch (e) {
        emit(InterestErrorState("No Interests Found"));
      }
    });
  }
}