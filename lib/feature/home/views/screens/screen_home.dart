import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_home_extra_list/property_home_extra_list_bloc.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_home_list/property_list_home_bloc.dart';
import 'package:user_resort_booking_app/feature/home/views/components/app_bar_for_home.dart';
import 'package:user_resort_booking_app/feature/home/views/widgets/extra_property_list_home_widget.dart';
import 'package:user_resort_booking_app/feature/home/views/widgets/top_rated_property_list_widget.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final searchController = SearchController();
  final sizedBoxHeight = 350;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<UserDataCubit>().isUserBlocked(context);
        // context.read<UserDataCubit>().updateFields();
        context.read<UserDataCubit>().fetchUserData();
      },
    );
    return Scaffold(
      appBar: AppBarForHome(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            context.read<PropertyListHomeBloc>().add(
                  PropertyListHomeEvent.fetchProperties(type: 'top-rated'),
                );
            context.read<PropertyHomeExtraListBloc>().add(
                  PropertyHomeExtraListEvent.fetchProperties(type: 'all'),
                );
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              MySpaces.hSpace20,

              //top rated
              TopRatedPropertyListWidget(
                sizedBoxHeight: sizedBoxHeight,
              ),

              MySpaces.hSpace40,

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Resorts',
                    style: MyTextStyles.titleMediumSemiBoldBlack,
                  ),
                  ExtraPropertyListHomeWidget(
                    sizedBoxHeight: sizedBoxHeight,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
