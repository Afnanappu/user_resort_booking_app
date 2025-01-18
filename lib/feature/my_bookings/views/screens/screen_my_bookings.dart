import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/components/custom_app_container.dart';
import 'package:user_resort_booking_app/core/components/custom_circular_progress_indicator.dart';
import 'package:user_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:user_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:user_resort_booking_app/feature/my_bookings/view_model/bloc/bloc_booked_property_list/booked_property_list_bloc.dart';

class ScreenMyBookings extends StatelessWidget {
  const ScreenMyBookings({super.key});

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
                    loading: () => Center(
                      child: CustomCircularProgressIndicator(),
                    ),
                    error: (error) => Center(
                      child: Text(error),
                    ),
                    initial: () => Center(
                      child: CustomCircularProgressIndicator(),
                    ),
                    orElse: () => Center(
                      child: Text('something unexpected happened'),
                    ),
                    loaded: (bookedModelList) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: bookedModelList.length,
                        itemBuilder: (context, index) {
                          final model = bookedModelList[index];
                          return BookedPropertyCard(
                            bookingId: model.bookingId,
                            propertyName: model.propertyName,
                            bookingDates:
                                '${customDateFormat(model.startDate)} - ${customDateFormat(model.endDate)}',
                            price: model.price,
                            imageUrl: model.imageUrl,
                            status: model.status,
                            onStatusPressed: () {},
                            onInfoPressed: () {},
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }
}

class BookedPropertyCard extends StatelessWidget {
  final String bookingId;
  final String propertyName;
  final String bookingDates;
  final String price;
  final String imageUrl;
  final String status;
  final VoidCallback? onInfoPressed;
  final VoidCallback? onStatusPressed;

  const BookedPropertyCard({
    super.key,
    required this.bookingId,
    required this.propertyName,
    required this.bookingDates,
    required this.price,
    required this.imageUrl,
    required this.status,
    this.onInfoPressed,
    this.onStatusPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      height: 180,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildDetails(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Booking Id: $bookingId',
          style: MyTextStyles.bodyLargeBoldBlack,
        ),
        IconButton(
          onPressed: onInfoPressed,
          icon: Icon(
            Icons.info_outline_rounded,
            color: MyColors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildDetails() {
    return Row(
      children: [
        _buildImage(),
        const SizedBox(width: 10),
        Expanded(
          child: _buildPropertyInfo(),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      width: 91,
      height: 82,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: MemoryImage(base64Decode(imageUrl)),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildPropertyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          propertyName,
          style: MyTextStyles.bodySmallMediumBlack,
        ),
        const SizedBox(height: 5),
        Text(
          bookingDates,
          style: MyTextStyles.bodySmallNormalBlack,
        ),
        const SizedBox(height: 10),
        _buildPriceAndStatus(),
      ],
    );
  }

  Widget _buildPriceAndStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(price, style: MyTextStyles.bodySmallMediumBlack),
        CustomElevatedButton(
          onPressed: onStatusPressed,
          text: '',
          outlined: true,
          height: 25,
          child: Text(
            status,
            style: MyTextStyles.bodySmallMediumBlack.apply(
              color: MyColors.orange,
            ),
          ),
        )
      ],
    );
  }
}
