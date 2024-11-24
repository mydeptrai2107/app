import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone_bloc/src/config/router/app_route_constants.dart';
import 'package:flutter_amazon_clone_bloc/src/presentation/widgets/common_widgets/search_text_form_field.dart';
import 'package:flutter_amazon_clone_bloc/src/utils/constants/constants.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 300,
      flexibleSpace: Container(
        decoration: const BoxDecoration(gradient: Constants.appBarGradient),
      ),
      title: Column(
        children: [
          // Image.asset(
          //   "assets/images/amazon_in.png",
          //   width: 200,
          //   height: 50,
          //   fit: BoxFit.contain,
          // ),
          SearchTextFormField(onTapSearchField: (String query) {
            context.pushNamed(AppRouteConstants.searchScreenRoute.name,
                pathParameters: {'searchQuery': query});
          }),
        ],
      ),
    );
  }
}
