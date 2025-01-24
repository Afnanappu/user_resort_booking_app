
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/components/custom_circular_progress_indicator.dart';
import 'package:user_resort_booking_app/core/components/custom_container_for_property_details.dart';
import 'package:user_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:user_resort_booking_app/core/components/payment_review_widget.dart';
import 'package:user_resort_booking_app/core/components/property_simple_card_component.dart';
import 'package:user_resort_booking_app/core/components/review_component_widget.dart';
import 'package:user_resort_booking_app/core/components/selected_room_widget.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/data/models/review_model.dart';
import 'package:user_resort_booking_app/core/data/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:user_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:user_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:user_resort_booking_app/core/utils/math_functions.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';
import 'package:user_resort_booking_app/feature/my_bookings/view_model/bloc/bloc/review_bloc.dart';
import 'package:user_resort_booking_app/feature/my_bookings/view_model/bloc/bloc_booked_property_details/booked_property_details_bloc.dart';
import 'package:user_resort_booking_app/core/components/custom_icon_widget.dart';
import 'package:user_resort_booking_app/feature/my_bookings/view_model/cubit/rating_count_cubit.dart';
import 'package:user_resort_booking_app/feature/my_bookings/views/components/booked_property_card.dart';
import 'package:user_resort_booking_app/feature/my_bookings/views/widgets/bottom_navigation_bar_for_booked_property_details.dart';
import 'package:user_resort_booking_app/feature/my_bookings/views/widgets/resort_review_form.dart';
import 'package:user_resort_booking_app/feature/my_bookings/views/widgets/your_booking_details_widget_for_booked_details.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenBookedPropertyDetails extends StatelessWidget {
  const ScreenBookedPropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = context.read<UserDataCubit>().state!;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {},
    );
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context.read<ReviewBloc>().add(ReviewEvent.clear());
      },
      child:
          BlocConsumer<BookedPropertyDetailsBloc, BookedPropertyDetailsState>(
        listener: (context, state) {
          state.maybeWhen(
            cancelled: () {
              showCustomSnackBar(
                context: context,
                message: 'Booking cancelled successfully',
                bgColor: MyColors.success,
              );
              context.pop();
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return Scaffold(
              appBar: CustomAppBar(
                title: 'Booking Details',
              ),
              body: Padding(
                padding: const EdgeInsets.all(12),
                child: state.maybeWhen(
                  initial: () => Center(
                    child: CustomCircularProgressIndicator(),
                  ),
                  loading: () => Center(
                    child: CustomCircularProgressIndicator(),
                  ),
                  error: (error) => Center(
                    child: Text(error),
                  ),
                  cancelled: () => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCircularProgressIndicator(),
                        Text('Cancelling the booking'),
                      ],
                    ),
                  ),
                  orElse: () => Center(
                    child: Text('Something unexpected happened'),
                  ),
                  loaded: (bookedPropertyDetails) {
                    final property = bookedPropertyDetails.property;
                    final bookingDetails = bookedPropertyDetails.bookingDetails;
                    final roomList = bookedPropertyDetails.bookedRooms;
                    final nights = bookingDetails.endDate
                        .difference(
                          bookingDetails.startDate,
                        )
                        .inDays;

                    context.read<ReviewBloc>().add(
                          ReviewEvent.fetchMyReview(
                            propertyId: bookingDetails.propertyId,
                            bookingId: bookingDetails.bookingId!,
                          ),
                        );
                    return ListView(
                      children: [
                        PropertySimpleCardComponent(
                          image: property.images.first.base64file,
                          propertyName: property.name,
                          location: property.location,
                          rating: getAverage(
                            property.reviews
                                .map(
                                  (e) => e.rating,
                                )
                                .toList(),
                          ),
                          reviews: property.reviews
                              .map(
                                (e) => e.feedback,
                              )
                              .toList(),
                          price: property.price,
                          onTap: () {
                            context.push('/${AppRoutes.propertyDetailsHome}');

                            //Loading the property details for next screen
                            context.read<PropertyDetailsHomeBloc>().add(
                                  PropertyDetailsHomeEvent.fetchPropertyDetails(
                                    id: property.id!,
                                  ),
                                );

                            final latLng = LatLng(
                              property.location.latitude,
                              property.location.longitude,
                            );
                            context.read<GoogleMapBloc>().add(
                                  GoogleMapEvent.mapInitialized(
                                    latLng,
                                  ),
                                );
                            context.read<GoogleMapBloc>().add(
                                  GoogleMapEvent.confirmLocation(
                                    latLng,
                                  ),
                                );
                          },
                        ),

                        MySpaces.hSpace20,

                        //booking details
                        YourBookingDetailsWidgetForBookedDetails(
                          startingDate:
                              customDateFormat(bookingDetails.startDate),
                          endDate: customDateFormat(bookingDetails.endDate),
                          peoples: bookingDetails.gustCount,
                          userData: userData,
                          bookingId: bookingDetails.bookingId!,
                        ),

                        MySpaces.hSpace20,

                        //Selected room list
                        SelectedRoomWidget(
                          isBooked: true,
                          roomList: roomList,
                          selectedDate: PickerDateRange(
                            bookingDetails.startDate,
                            bookingDetails.endDate,
                          ),
                          peoples: bookingDetails.gustCount,
                          nights: nights,
                        ),

                        MySpaces.hSpace20,

                        //Payment
                        PaymentReviewWidget(
                          roomList: roomList,
                          nights: nights,
                          price: bookingDetails.totalPrice,
                        ),

                        MySpaces.hSpace20,
                        if (getBookingStatus(bookingDetails.status) !=
                            BookingStatus.completed)
                          CustomContainerForPropertyDetails(
                            title: 'Cancellation Eligibility',
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                              ),
                              child: Column(
                                spacing: 8,
                                children: [
                                  // 'Cancel at least 3 days (72 hours) before check-in for a full refund.',
                                  // 'Cancellations made between 24 to 72 hours before check-in will be eligible for a 50% refund.',
                                  // 'Cancellations within 24 hours of check-in or no-shows will not be refunded.'
                                  '100% Refund for cancellations made within 2 hours of booking.',
                                  '100% Refund if cancelled more than 72 hours before check-in',
                                  '70% Refund for cancellations made between 24 to 72 hours before check-in.',
                                  'No Refund for cancellations made less than 24 hours before check-in.',
                                  'Bookings made less than 24 hours before check-in are non-refundable.',
                                  'Bookings Fee will not be included in this refunds'
                                ]
                                    .map(
                                      (item) => CustomIconTextWidget(
                                        icon: Icon(
                                          Icons.circle,
                                          size: 6,
                                        ),
                                        content: Expanded(child: Text(item)),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),

                        //show the review section if booking completed
                        if (getBookingStatus(bookingDetails.status) ==
                            BookingStatus.completed)
                          BlocBuilder<ReviewBloc, ReviewState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                submitted: (review) {
                                  return ReviewComponentWidget(
                                    review: review,
                                  );
                                },
                                orElse: () => ResortReviewForm(
                                  reviewController: TextEditingController(),
                                  formKey: GlobalKey<FormState>(),
                                  onSubmit: (review) {
                                    final rating =
                                        context.read<RatingCountCubit>().state;

                                    final newReview = ReviewModel(
                                      userId: bookingDetails.userId,
                                      propertyId: bookingDetails.propertyId,
                                      rating: rating,
                                      feedback: review,
                                      timestamp: DateTime.now(),
                                      status: 'approved',
                                      bookingId: bookingDetails.bookingId!,
                                    );

                                    context
                                        .read<ReviewBloc>()
                                        .add(ReviewEvent.addReview(newReview));
                                  },
                                ),
                              );
                            },
                          )
                      ],
                    );
                  },
                ),
              ),
              bottomNavigationBar: state.maybeWhen(
                loaded: (bookedPropertyDetails) {
                  final status = getBookingStatus(
                      bookedPropertyDetails.bookingDetails.status);
                  return status == BookingStatus.cancelled ||
                          status == BookingStatus.completed
                      ? null
                      : BottomNavigationBarForBookedPropertyDetails(
                          state: state,
                        );
                },
                orElse: () {
                  return null;
                },
              ));
        },
      ),
    );
  }
}
