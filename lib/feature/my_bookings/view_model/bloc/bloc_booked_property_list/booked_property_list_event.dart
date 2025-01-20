part of 'booked_property_list_bloc.dart';

@freezed
class BookedPropertyListEvent with _$BookedPropertyListEvent {
  const factory BookedPropertyListEvent.fetchMyBookings(
      {required String userId, String? type}) = _FetchMyBookings;
}
