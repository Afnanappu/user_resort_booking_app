import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/components/custom_search_bar.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_home_list/property_list_home_bloc.dart';
import 'package:user_resort_booking_app/feature/home/views/components/app_bar_for_home.dart';
import 'package:user_resort_booking_app/feature/home/views/widgets/property_widget.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final searchController = SearchController();
  final sizedBoxHeight = 350;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        // final uid = FirebaseAuth.instance.currentUser!.uid;
        context
            .read<PropertyListHomeBloc>()
            .add(PropertyListHomeEvent.fetchProperties());
      },
    );
    return Scaffold(
      appBar: AppBarForHome(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            context.read<PropertyListHomeBloc>().add(
                  PropertyListHomeEvent.fetchProperties(),
                );
          },
          child: ListView(
            children: [
              CustomSearchBar(
                searchController: searchController,
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return [];
                },
              ),
              MySpaces.hSpace40,

              //top rated
              BlocBuilder<PropertyListHomeBloc, PropertyListHomeState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    initial: () => SizedBox(
                      height: MyScreenSize.height - sizedBoxHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 48, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'Welcome! Start exploring properties.',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    error: (message) => SizedBox(
                      height: MyScreenSize.height - sizedBoxHeight,
                      child: Center(
                        child: Text(
                          message,
                          style: TextStyle(
                            color: MyColors.error,
                          ),
                        ),
                      ),
                    ),
                    loading: () => SizedBox(
                      height: MyScreenSize.height - sizedBoxHeight,
                      child: Center(
                        child: Text(
                          'Loading...',
                        ),
                      ),
                    ),
                    loaded: (propertyList) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Top Rated Resorts',
                            style: MyTextStyles.titleMediumSemiBoldBlack,
                          ),
                          MySpaces.hSpace10,
                          propertyList.isEmpty
                              ? Center(
                                  child: Text('No property added'),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  // scrollDirection: Axis.horizontal,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: propertyList.length,
                                  itemBuilder: (context, index) {
                                    final property = propertyList[index];
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: PropertyWidget(
                                        image: property.image.base64file,
                                        propertyName: property.name,
                                        location: property.location,
                                        rating: property.rating ?? 0,
                                        reviews: property.reviews,
                                        rooms: property.rooms,
                                        price: property.price,
                                        onTap: () {
                                          context.push(
                                              '/${AppRoutes.propertyDetailsHome}');

                                          //Loading the property details for next screen
                                          context
                                              .read<PropertyDetailsHomeBloc>()
                                              .add(
                                                PropertyDetailsHomeEvent
                                                    .fetchPropertyDetails(
                                                  id: property.id!,
                                                ),
                                              );
                                        },
                                      ),
                                    );
                                  },
                                ),
                        ],
                      );
                    },
                    orElse: () {
                      return Center(
                        child: Text('Something unexpected happened, try again'),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class PropertyCardHomeWidget extends StatelessWidget {
//   const PropertyCardHomeWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           clipBehavior: Clip.antiAlias,
//           decoration: ShapeDecoration(
//             color: Colors.white,
//             shape: RoundedRectangleBorder(
//               side: BorderSide(width: 0.20, color: Color(0xFF8A8989)),
//               borderRadius: BorderRadius.circular(6),
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Image section
//               Container(
//                 height: 114,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage("https://via.placeholder.com/207x114"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               // Content section
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Title
//                     Text(
//                       'Caitlyn Resort',
//                       style: MyTextStyles.titleSmallSemiBoldBlack,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 4),
//                     // Location and Rating
//                     Row(
//                       children: [
//                         // Location
//                         Row(
//                           children: [
//                             Icon(Icons.location_on,
//                                 size: 12, color: Colors.grey),
//                             const SizedBox(width: 4),
//                             Text(
//                               'Canggu, Bali',
//                               style: MyTextStyles.textFieldNormalGreyLight,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                         const Spacer(),
//                         // Rating
//                         Row(
//                           children: [
//                             Icon(Icons.star, size: 12, color: Colors.yellow),
//                             const SizedBox(width: 4),
//                             Text(
//                               '4.9 (132 Reviews)',
//                               style: MyTextStyles.textFieldNormalGreyLight,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     // Rooms and Price
//                     Row(
//                       children: [
//                         Text(
//                           'Available Rooms: 4',
//                           style: MyTextStyles.bodySmallMediumBlack,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const Spacer(),
//                         Text.rich(
//                           TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: 'from ₹4290 ',
//                                 style: MyTextStyles.bodySmallMediumBlack,
//                               ),
//                               TextSpan(
//                                 text: '/day',
//                                 style: MyTextStyles.textFieldNormalGreyLight,
//                               ),
//                             ],
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
