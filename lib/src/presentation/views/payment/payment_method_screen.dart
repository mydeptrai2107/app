import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone_bloc/src/logic/blocs/order/payment_cubit/payment_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn phương thức thanh toán'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.payment,
              size: 32,
            ),
            title: const Text('Thanh toán khi nhận hàng'),
            onTap: () {
              context.read<PaymentCubit>().selectPaymentMethod('cod');
              context.pop();
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/zalo.png',
              width: 32,
              height: 32,
            ),
            title: const Text('Thanh toán với ZaloPay'),
            onTap: () {
              context.read<PaymentCubit>().selectPaymentMethod('zalopay');
              context.pop();
            },
          )
        ],
      ),
    );
  }
}
