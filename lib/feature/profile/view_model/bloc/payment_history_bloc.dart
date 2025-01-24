import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_resort_booking_app/feature/profile/model/payment_history_card_model.dart';
import 'package:user_resort_booking_app/feature/profile/repository/payment_history_repository.dart';

part 'payment_history_event.dart';
part 'payment_history_state.dart';
part 'payment_history_bloc.freezed.dart';

class PaymentHistoryBloc
    extends Bloc<PaymentHistoryEvent, PaymentHistoryState> {
  final PaymentHistoryRepository _repository;
  PaymentHistoryBloc(this._repository) : super(_Initial()) {
    on<_FetchPaymentHistory>((event, emit) async {
      emit(PaymentHistoryState.loading());

      try {
        final transactions =
            await _repository.fetchMyPaymentTransactions(userId: event.userId);
        emit(PaymentHistoryState.loaded(transactions));
      } catch (e) {
        emit(PaymentHistoryState.error(e.toString()));
      }
    });
  }
}
