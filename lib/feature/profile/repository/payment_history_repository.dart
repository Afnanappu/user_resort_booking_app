// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:user_resort_booking_app/core/data/models/transaction_model.dart';
import 'package:user_resort_booking_app/core/data/services/transaction_services.dart';
import 'package:user_resort_booking_app/feature/profile/model/payment_history_card_model.dart';

class PaymentHistoryRepository {
  final TransactionServices _transactionServices;
  PaymentHistoryRepository({
    required TransactionServices transactionServices,
  }) : _transactionServices = transactionServices;

  Future<List<PaymentHistoryModel>> fetchMyPaymentTransactions({
    required String userId,
  }) async {
    try {
      final transactionData =
          await _transactionServices.fetchMyPaymentTransactions(userId: userId);

      final transactionModels = transactionData
          .map(
            (e) => TransactionModel.fromMap(e!),
          )
          .toList();
      final paymentHistoryList = <PaymentHistoryModel>[];
      for (var element in transactionModels) {
        final ownerData = await _transactionServices.ownerData(element.ownerId);
        final name = ownerData!['name'] as String;
        final profile = ownerData['profilePicture'] != null
            ? ownerData['profilePicture'] as String
            : null;
        paymentHistoryList.add(
          PaymentHistoryModel(
            payerName: name,
            profile: profile,
            transactionModel: element,
          ),
        );
      }

      //sort it based on time.
      paymentHistoryList.sort(
        (a, b) => b.transactionModel.transactionDate
            .compareTo(a.transactionModel.transactionDate),
      );
      return paymentHistoryList;
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }
}
