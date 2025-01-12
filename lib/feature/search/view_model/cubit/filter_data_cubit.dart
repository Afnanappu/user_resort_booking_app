import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/feature/search/model/filter_data_model.dart';

class FilterDataCubit extends Cubit<FilterDataModel?> {
  FilterDataCubit() : super(null);

  void setFilterData(FilterDataModel filterModel) {
    emit(filterModel);
  }

  void clear() {
    emit(null);
  }
}
