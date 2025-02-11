import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/feature/profile/view/components/payment_history_card.dart';
import 'package:user_resort_booking_app/feature/profile/view_model/bloc/bloc_payment_history/payment_history_bloc.dart';
import 'package:collection/collection.dart';

class ScreenPaymentHistory extends StatelessWidget {
  ScreenPaymentHistory({super.key});
  final height = MyScreenSize.height * .2;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchPaymentHistory(context);
    });
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment History',
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          _fetchPaymentHistory(context);
        },
        child: ListView(
          children: [
            BlocBuilder<PaymentHistoryBloc, PaymentHistoryState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return PaymentHistoryCardShimmer();
                    },
                  ),
                  error: (error) => SizedBox(
                    height: MyScreenSize.height - height,
                    child: Center(
                      child: Text(error),
                    ),
                  ),
                  orElse: () => SizedBox(
                    height: MyScreenSize.height - height,
                    child: Center(
                      child: Text('An unexpected error occurred'),
                    ),
                  ),
                  loaded: (loadedValue) {
                    final transactions = groupBy(
                      loadedValue,
                      (value) {
                        return DateFormat.yMMMd().format(
                          value.transactionModel.createdAt,
                        );
                      },
                    );
                    return transactions.isEmpty
                        ? SizedBox(
                            height: MyScreenSize.height - height,
                            child: Center(
                              child: Text('No transaction found',
                                style: MyTextStyles.bodyLargeNormalGrey,
                              ),
                            ),
                          )
                        : ListView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: transactions.entries.map(
                              (transaction) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(transaction.key),
                                    ),
                                    ...transaction.value.map(
                                      (payment) {
                                        return PaymentHistoryCard(
                                          userName: payment.payerName,
                                          profile: payment.profile,
                                          amount:
                                              payment.transactionModel.amount,
                                          transactionDate:
                                              DateFormat.jm().format(
                                            payment.transactionModel
                                                .transactionDate,
                                          ),
                                          status: payment.transactionModel
                                                      .status ==
                                                  'failed'
                                              ? 'failed'
                                              : payment.transactionModel.type,
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            ).toList(),
                          );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _fetchPaymentHistory(BuildContext context) {
    final userId = context.read<UserDataCubit>().state!.uid!;
    context
        .read<PaymentHistoryBloc>()
        .add(PaymentHistoryEvent.fetchPaymentHistory(userId: userId));
  }
}
