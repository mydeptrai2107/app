import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone_bloc/src/config/router/app_route_constants.dart';
import 'package:flutter_amazon_clone_bloc/src/presentation/widgets/account/account_button.dart';
import 'package:flutter_amazon_clone_bloc/src/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AccountButton(
                buttonName: 'Đơn hàng của bạn',
                onPressed: () {
                  context
                      .pushNamed(AppRouteConstants.yourOrdersScreenRoute.name);
                }
                // Navigator.pushNamed(context, YourOrders.routeName)
                ),
            const SizedBox(
              width: 10,
            ),
            AccountButton(buttonName: 'Mua lại', onPressed: () {}),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AccountButton(
              buttonName: 'Đăng xuất',
              onPressed: () async {
                try {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();

                  await sharedPreferences.setString('x-auth-token', '');

                  if (context.mounted) {
                    context.goNamed(AppRouteConstants.authRoute.name);
                  }
                } catch (e) {
                  if (context.mounted) {
                    showSnackBar(context, e.toString());
                  }
                }
              },
            ),
            const SizedBox(
              width: 10,
            ),
            AccountButton(
              buttonName: 'Danh sách yêu sách',
              onPressed: () {
                context
                    .pushNamed(AppRouteConstants.yourWishListScreenRoute.name);
              },
            ),
          ],
        ),
      ],
    );
  }
}
