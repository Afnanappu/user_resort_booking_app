import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:user_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/my_constants.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/feature/my_bookings/view_model/cubit/rating_count_cubit.dart';

class ResortReviewForm extends StatelessWidget {
  final TextEditingController reviewController;
  final GlobalKey<FormState> formKey;
  final void Function(String review) onSubmit;

  const ResortReviewForm({
    super.key,
    required this.reviewController,
    required this.formKey,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Share Your Experience',
              style: MyTextStyles.titleLargeSemiBoldBlack,
            ),
            const SizedBox(height: 16),
            BlocBuilder<RatingCountCubit, int>(
              builder: (context, selectedRating) {
                return StarRating(
                  rating: selectedRating.toDouble(),
                  allowHalfRating: false,
                  size: 40,
                  color: MyColors.orange,
                  onRatingChanged: (rating) {
                    context
                        .read<RatingCountCubit>()
                        .updateRating(rating.toInt());
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: reviewController,
              maxLines: 4,
              maxLength: 250,
              decoration: InputDecoration(
                hintText: 'Write your review here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.orange, width: 2),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please write a review before submitting.';
                }
                if (value.length < 10) {
                  return 'Review should be at least 10 characters long.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRad10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    onSubmit(reviewController.text);
                    showCustomSnackBar(
                      context: context,
                      message: 'Thank you for your review!',
                      bgColor: MyColors.grey,
                    );
                    reviewController.clear();
                  }
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ReviewListWidget extends StatelessWidget {
//   const ReviewListWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: BlocBuilder<ReviewBloc, List<ReviewModel>>(
//         builder: (context, reviews) {
//           if (reviews.isEmpty) {
//             return const Center(
//               child: Text(
//                 'No reviews yet. Be the first to share your experience!',
//                 style: TextStyle(fontSize: 16),
//               ),
//             );
//           }

//           return ListView.separated(
//             shrinkWrap: true,
//             itemCount: reviews.length,
//             separatorBuilder: (_, __) => const SizedBox(height: 16),
//             itemBuilder: (context, index) {
//               final review = reviews[index];
//               return Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 elevation: 3,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             'Rating:',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           StarRating(
//                             rating: review.rating.toDouble(),
//                             size: 20,
//                             allowHalfRating: false,
//                             color: MyColors.orange,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         review.feedback,
//                         style: const TextStyle(fontSize: 16),
//                       ),
//                       const SizedBox(height: 8),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           review.timestamp.toString(), // Display the timestamp
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class ReviewAndRatingWidget extends StatelessWidget {
//   final String bookingId; // Pass the booking ID for associating the review
//   final void Function(String review, int rating) onSubmit;

//   const ReviewAndRatingWidget({
//     super.key,
//     required this.bookingId,
//     required this.onSubmit,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController reviewController = TextEditingController();
//     int userRating = 0; // Holds the user's selected rating

//     return Container(
//       height: 160,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Rate Your Experience',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Row(
//             children: List.generate(5, (index) {
//               return GestureDetector(
//                 onTap: () {
//                   userRating = index + 1; // Update the rating value
//                 },
//                 child: Icon(
//                   index < userRating ? Icons.star : Icons.star_border,
//                   color: Colors.orange,
//                   size: 30,
//                 ),
//               );
//             }),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Write a Review',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 8),
//           TextField(
//             controller: reviewController,
//             maxLines: 3,
//             decoration: InputDecoration(
//               hintText: 'Share your experience...',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Align(
//             alignment: Alignment.centerRight,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               onPressed: () {
//                 if (userRating == 0 || reviewController.text.isEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text(
//                         'Please provide a rating and review before submitting.',
//                       ),
//                     ),
//                   );
//                   return;
//                 }
//                 onSubmit(
//                     reviewController.text, userRating); // Call submit function
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('Thank you for your feedback!'),
//                   ),
//                 );
//               },
//               child: const Text('Submit'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
