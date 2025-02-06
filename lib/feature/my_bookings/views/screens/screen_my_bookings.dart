import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:user_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/feature/my_bookings/view_model/bloc/bloc_booked_property_details/booked_property_details_bloc.dart';
import 'package:user_resort_booking_app/feature/my_bookings/view_model/bloc/bloc_booked_property_list/booked_property_list_bloc.dart';
import 'package:user_resort_booking_app/feature/my_bookings/views/components/booked_property_card.dart';
import 'package:user_resort_booking_app/feature/my_bookings/views/components/popup_menu_for_my_bookings.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenMyBookings extends StatelessWidget {
  const ScreenMyBookings({super.key});
  final middle = 0.75;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final userId = context.read<UserDataCubit>().state!.uid!;
        context
            .read<BookedPropertyListBloc>()
            .add(BookedPropertyListEvent.fetchMyBookings(userId: userId));
      },
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Bookings',
        actions: [
          //sorting dropdown menu icon button
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: PopupMenuForMyBookings(),
          ),
        ],
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          final userId = context.read<UserDataCubit>().state!.uid!;
          context.read<BookedPropertyListBloc>().add(
                BookedPropertyListEvent.fetchMyBookings(userId: userId),
              );
        },
        child: ListView(
          children: [
            BlocBuilder<BookedPropertyListBloc, BookedPropertyListState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) =>
                        BookedPropertyCardShimmer(),
                  ),
                  error: (error) => SizedBox(
                    height: MyScreenSize.height * middle,
                    child: Center(
                      child: Text(error),
                    ),
                  ),
                  orElse: () => SizedBox(
                    height: MyScreenSize.height * middle,
                    child: Center(
                      child: Text('something unexpected happened'),
                    ),
                  ),
                  loaded: (bookedModelList) {
                    return bookedModelList.isEmpty
                        ? SizedBox(
                            height: MyScreenSize.height * middle,
                            child: Center(
                              child: Text('No Booking found'),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: bookedModelList.length,
                            itemBuilder: (context, index) {
                              final model = bookedModelList[index];
                              return GestureDetector(
                                onTap: () async {
                                  context.read<BookedPropertyDetailsBloc>().add(
                                          BookedPropertyDetailsEvent
                                              .fetchBookedDetails(
                                        ownerId: model.ownerId,
                                        bookingId: model.bookingId,
                                      ));

                                  context.push(
                                      '/${AppRoutes.bookedPropertyDetails}');
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
}
