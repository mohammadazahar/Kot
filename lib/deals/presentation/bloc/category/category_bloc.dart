



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kot/boat_booking/data/model/booking_history.dart';

import '../../../data/repository/cateogry_repo.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc
    extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepo = CategoryRepository();
  CategoryBloc(CategoryRepository categoryRepository) : super(CategoryLoadingState()) {
    on<FetchCategoryEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        final categoryApi = await categoryRepo.callGetCategoryApi();
        if (categoryApi != null) {

          emit(CategoryLoadedState(categoryApi));
        }
      } catch (e) {
        emit(CategoryErrorState("No CategoryList Found"));
      }
    });
  }
}