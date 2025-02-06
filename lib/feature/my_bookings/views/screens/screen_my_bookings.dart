import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:user_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/feature/my_bookings/model/booked_property_card_model.dart';
import 'package:user_resort_booking_app/feature/my_bookings/view_model/bloc/bloc_booked_property_details/booked_property_details_bloc.dart';
import 'package:user_resort_booking_app/feature/my_bookings/view_model/bloc/bloc_booked_property_list/booked_property_list_bloc.dart';
import 'package:user_resort_booking_app/feature/my_bookings/views/components/booked_property_card.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenMyBookings extends StatelessWidget {
  const ScreenMyBookings({super.key});
  final middle = 0.75;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = context.read<UserDataCubit>().state!.uid!;
      context.read<BookedPropertyListBloc>().add(
            BookedPropertyListEvent.fetchMyBookings(userId: userId),
          );
    });

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Bookings',
            style: MyTextStyles.titleLargeSemiBoldBlack,
          ),
          actionsIconTheme: IconThemeData(size: 30),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.only(right: 10),
          //     child: PopupMenuForMyBookings(),
          //   ),
          // ],
          bottom: const TabBar(
            indicatorColor: MyColors.orange,
            labelColor: MyColors.orange,
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Past'),
            ],
          ),
        ),
        body: BlocBuilder<BookedPropertyListBloc, BookedPropertyListState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => ListView.builder(
                itemCount: 6,
                itemBuilder: (_, __) => BookedPropertyCardShimmer(),
              ),
              error: (error) => SizedBox(
                height: MyScreenSize.height * middle,
                child: Center(child: Text(error)),
              ),
              loaded: (bookedModelList) {
                final upcomingBookings = bookedModelList.where(
                  (booking) {
                    final b = booking.status.toLowerCase();
                    return b == 'booked' || b == 'active';
                  },
                ).toList();
                final pastBookings = bookedModelList.where((booking) {
                  final b = booking.status.toLowerCase();
                  return b == 'completed' || b == 'cancelled';
                }).toList();

                return TabBarView(
                  children: [
                    _buildBookingList(upcomingBookings, context),
                    _buildBookingList(pastBookings, context),
                  ],
                );
              },
              orElse: () => SizedBox(
                height: MyScreenSize.height * middle,
                child: Center(child: Text('Something unexpected happened')),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBookingList(
      List<BookedPropertyCardModel> bookings, BuildContext context) {
    if (bookings.isEmpty) {
      return SizedBox(
        height: MyScreenSize.height * middle,
        child: Center(child: Text('No bookings found')),
      );
    }

    return RefreshIndicator.adaptive(
      onRefresh: () async {
        final userId = context.read<UserDataCubit>().state!.uid!;
        context.read<BookedPropertyListBloc>().add(
              BookedPropertyListEvent.fetchMyBookings(userId: userId),
            );
      },
      child: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final model = bookings[index];
          return GestureDetector(
            onTap: () {
              context.read<BookedPropertyDetailsBloc>().add(
                    BookedPropertyDetailsEvent.fetchBookedDetails(
                      ownerId: model.ownerId,
                      bookingId: model.bookingId,
                    ),
                  );
              context.push('/${AppRoutes.bookedPropertyDetails}');
            },
            child: BookedPropertyCard(
              bookingId: model.bookingId,
              propertyName: model.propertyName,
              bookingDates:
                  '${customDateFormat(model.startDate)} - ${customDateFormat(model.endDate)}',
              price: model.price,
              imageUrl: model.imageUrl,
              status: getBookingStatus(model.status),
              onStatusPressed: () {},
            ),
          );
        },
      ),
    );
  }
}
