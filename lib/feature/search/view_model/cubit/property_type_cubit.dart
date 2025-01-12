import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/feature/search/repository/my_property_repository.dart';
class PropertyTypeCubit extends Cubit<List<String>> {
  final MyPropertyRepository _repository;
  PropertyTypeCubit(this._repository) : super([]);

  void fetchRoomCategories() async {
    try {
      final data = await _repository.fetchPropertyCategories();
      emit(data);
    } catch (e) {
      emit(state);
    }
  }
}
