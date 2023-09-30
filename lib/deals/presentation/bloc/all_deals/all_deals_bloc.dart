

// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../data/repository/all_deals_repo.dart';
// import 'all_deals_event.dart';
// import 'all_deals_state.dart';

// class AllDealsBloc
//     extends Bloc<AllDealsEvent, AllDealsState> {
//   final AllDealRepository allDealRepository = AllDealRepository();
//   AllDealsBloc(AllDealRepository allDealRepository) : super(AllDealsLoadingState()) {
//     on<FetchAllDealsEvent>((event, emit) async {
//       emit(AllDealsLoadingState());
//       try {
//         final dealApi = await allDealRepository.callDealApi();
//         if (dealApi != null) {
//           emit(AllDealsLoadedState(dealApi));
//         }
//       } catch (e) {
//         emit(AllDealsErrorState("No deals Found"));
//       }
//     });
//   }
// }